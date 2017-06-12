# def quick_sort(arr)
#   return arr if arr.length < 2
#   pivot_index = rand(arr.length)
#   less = []
#   greater = []
#   arr.each_with_index do |e,i|
#     if i == pivot_index
#       next
#     end
#     if e <= arr[pivot_index]
#       less << e
#     else
#       greater << e
#     end
#   end
#   return quick_sort(less) + [arr[pivot_index]] + quick_sort(greater)
# end

def quick_sort(arr)
  return arr if arr.length < 2
  pivot = arr.delete_at(rand(arr.length - 1))
  left, right = arr.partition { |e| e <= pivot }
  return quick_sort(left) + [pivot] + quick_sort(right)
end

puts quick_sort([-4, 5, 2, 5, 4, 8, 1])
