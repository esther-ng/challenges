# given an unsorted array and an integer k, find the kth largest element in the array

def selection_algorithm(arr, k)
  response = quicksort(arr,k)
  puts response.to_s
  puts response[-k]
end

def quicksort(arr, k)
  return arr if arr.length < 2
  pivot = arr.delete_at(rand(arr.length - 1))
  left, right = arr.partition { |e| e <= pivot }
  if right.length < k
    return quicksort(left, k) + [pivot] + quicksort(right, k)
  elsif k <= right.length
    return quicksort(right, k)
  end
end

# def quicksort(arr, k)
#   pivot_index = rand(arr.length - 1)
#   less = []
#   more = []
#   arr.each_with_index do |e, i|
#     return if pivot_index == i
#     if e <= arr[pivot_index]
#       less << e
#     else
#       more << e
#     end
#   end
#   if (arr.length - k) > pivot_index
#     return arr[pivot_index] + selection_algorithm(more)
#   else
#     return quicksort(less, k) + arr[pivot_index] + quicksort(more, k)
#   end
# end

selection_algorithm([7, 2, 1, 3, 4], 3)
