def egg(floors)
  mid = floors/2
  drop_egg_from(mid)
  if breaks?
    (0...mid).each do |i|
      drop_egg_from(i)
      if breaks?
        return i - 1
      end
    end
  else
    mid += mid/2
    (mid..floors).each do |i|
      drop_egg_from(i)
      if breaks?
        return i - 1
      end
    end
  end
  return floors
end
