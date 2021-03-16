module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |res, el|
          res.push(yield(el))
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |res, el|
          el.nil? ? res : res.push(el)
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial
        i = 0
        my_each do |el|
          acc = i.zero? && acc.nil? ? el : yield(acc, el)
          i += 1
        end

        acc
      end
    end
  end
end
