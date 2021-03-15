module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        has_many_countries = ->(country) { country.split(',').length > 1 }

        ratings = films.filter { |film| has_many_countries.call(film['country'] || '') }
                       .map { |film| film['rating_kinopoisk'].to_f }
                       .filter(&:positive?)

        ratings.reduce(:+) / ratings.length
      end

      def chars_count(films, threshold)
        films.filter { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'].count('и') }
             .reduce(:+)
      end
    end
  end
end
