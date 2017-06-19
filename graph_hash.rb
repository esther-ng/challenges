graph = {} # keys are vertices
graph['seattle'] = {'ny' => 1, 'miami' => 1}
graph['miami'] = {'rio' => 1}
graph['rio'] = {'ba' => 1}
graph['ny'] = {'ba' => 1, 'rio' => 1}

def shortest_path(a, b, graph)
  distance = {} # for each vertex
  previous = {} # for each vertex
  distance[a] = 0
  queue = [a]
  marked = {} # for each vertex
  until queue.empty?
    puts "Queue: #{queue}"
    x = queue.shift
    graph[x]&.keys&.each do |v|
      unless marked[v]
        distance[v] = distance[x] + 1
        previous[v] = x
        queue << v
        marked[v] = true
      end
    end
  end
  if distance[b]
    puts "Distance: #{distance[b]}"
    puts distance
    puts "Previous: "
    puts previous
    puts print_path(a, b, previous)
  else
    puts "No path found"
  end
end

def print_path(a, b, previous)
  s = b
  until b == a
    b = previous[b]
    s.insert(0, "#{b} -> ")
  end
  return s
end

shortest_path('seattle', 'ba', graph)
shortest_path('seattle', 'seattle', graph)
shortest_path('seattle', 'boston', graph)
