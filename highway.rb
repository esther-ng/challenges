def highway(a, b)
  i = j = 0
  hour = 10
  indices = []
  current_hour_index_north = nil
  current_hour_index_south = nil
  until i == a.length
    if a[i] < hour
      current_hour_index_north = i
    else
      indices << current_hour_index_north
      current_hour_index_north = nil
      hour += 10
    end
    if a[i] == b[j]
      b.delete_at(j)
      b.delete_at(j+1)
    elsif b[j] < hour
      current_hour_index_south = j
      j += 2
    else
      indices << current_hour_index_south
      current_hour_index_south = nil
      hour += 10
      j += 2
    end
    i += 2
  end
  return indices
end

def calculate_speed(one, two)
  (two - one)/axel_distance
end
