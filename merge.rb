# def merge(a, b)
#   main = a.length >= b.length ? a : b
#   max = main.length
#   min = 0
#   mid = (max - min)/ 2
#   b.each do |e|
#     if e < a[mid]
#       merge(a[min..mid])
#     else
#       merge(a[mid..max])
#     end
#   end

def merge(a, b)
  b.each do |e|
    next if e.nil?
    a.each_with_index do |f, i|
      next if f.nil?
      if e < f
        a.insert(i, e)
        break
      end
    end
    if e > a.last
      a.push(e)
      break
    end
  end
  a
end


list1 = [nil, 1, 5, 8, 10]
list2 = [0, 4, 9, 12, 16]
puts merge(list1, list2)
