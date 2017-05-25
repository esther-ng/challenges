def binary_search(arr, val)
  floor = 0
  ceiling = arr.length - 1
  guess = (ceiling - floor)/2

  # return true if arr[guess] == val

  if val < arr[guess]
    ceiling = guess - 1
  elsif val > arr[guess]
    floor = guess + 1
  else
    return true
  end

  return false if floor > ceiling

  binary_search(arr[floor..ceiling], val)
end

input = [1, 3, 5, 10, 20, 29, 500]

puts binary_search(input, 500)
puts binary_search(input, 1000)
puts binary_search(input, 0)
puts binary_search(input, -2)
puts binary_search(input, 20)
puts binary_search(input, 1)
puts binary_search(input, 5)
