# make a BST and median will be root or half of root + root.left or right USE A HEAP
require_relative './heap'

class List
    attr_accessor :max_heap, :min_heap

    def initialize
        @max_heap = MaxHeap.new
        @min_heap = MinHeap.new
    end

    def insert(num)
        if @max_heap.size == 1
            @max_heap << num
            return
        elsif @max_heap.size == @min_heap.size
          if num < @min_heap.root
            @max_heap << num
          else
            @min_heap << num
            @max_heap << @min_heap.pop
          end
        elsif @max_heap.size > @min_heap.size
          if num > @max_heap.root
            @min_heap << num
          else
            @max_heap << num
            @min_heap << @max_heap.pop
          end
        end
    end

    def median
      if @max_heap.size == @min_heap.size
        return (@max_heap.root + @min_heap.root)/2
      else
        return @max_heap.root/1
      end
    end
end

n = gets.chomp.to_i

list = List.new

n.times do
    f = gets.chomp.to_f
    list.insert(f)
    puts list.median
end


#
# def find_index(num)
#     if num < @data.first
#         return 0
#     elsif num > @data.last
#         return @size
#     end
#     floor = 0
#     ceil = @size - 1
#     current_index = (ceil-floor)/2
#     until floor >= ceil
#         if num < @data[current_index]
#             ceil = current_index
#         elsif num > @data[current_index]
#             floor = current_index + 1
#         end
#         current_index = floor + (ceil-floor)/2
#     end
#     return current_index
# end
