
def balanced?(s)
  stack = []
  legend = { "{" => "}", "[" => "]", "(" => ")" }
  s.each_char do |l|
      if legend[l]
          stack << l
      elsif legend.values.include?(l)
          popped = stack.pop
          puts popped
          return false if popped.nil?
          if l != legend[popped]
            return false
          end
      end
  end
  if stack.empty?
    return true
  end
  return false
end

t = gets.strip.to_i
for a0 in (0..t-1)
    s = gets.strip
    if balanced?(s) == true
      puts 'YES'
    else
      puts 'NO'
    end
end
