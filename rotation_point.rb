# def rotation(words)
#   top = 0
#   bottom = words.length - 1
#   diff = bottom - top
#   until top >= bottom
#     if words[top] > words[bottom]
#       top += diff
#       puts "top: " + words[top]
#     else
#       bottom -= diff
#       puts "bottom: " + words[bottom]
#     end
#     diff /= 2
#   end
#   puts "top & bottom: " + words[top] + words[bottom]
#   puts "indexes: #{top}, #{bottom}"
# end

def rotation(words)
  return 0 if words[0] < words[-1]
  top = 0
  bottom = words.length - 1
  point = (bottom - top)/2
  until (words[point] < words[point + 1]) && (words[point] < words[point - 1])
    if words[point] < words[top]
      bottom = point
      puts "if bottom is " + point.to_s
    else
      top = point 
      puts "top is " + top.to_s
    end
    point = (top + (bottom - top)/2)
  end
  puts words[point]
  return point
end

input = [
  "cougar",
  "dog",
  "kitty",
  "lion",
  "monkey",
  "narnia",
  "o",
  "p",
  "zebra",
  "animal",
  "bear",
  "bobby"
]

puts rotation(input)
