class Node
  attr_accessor :value, :neighbors, :visited

  def initialize(value)
    @value = value
    @neighbors = []
    @visited = false
  end
end

start = Node.new("Seattle")
ny = Node.new("NY")
miami = Node.new("Miami")
start.neighbors << ny
start.neighbors << miami
rio = Node.new("Rio")
ba = Node.new("BA")
ny.neighbors << ba
miami.neighbors << rio
rio.neighbors << ba

def find_path(start, finish)
  q = [start]
  distance = {}
  distance[start] = 0
  previous = {}
  until q.empty?
    current = q.shift
    current.neighbors.each do |neib|
      unless neib.visited
        distance[neib] = distance[current] + 1
        previous[neib] = current
        neib.visited = true
        q << neib
      end
    end
  end
  if distance[finish]
    puts "Shortest path: #{distance[finish]}"
    puts "Path: "
    puts print_path(start, finish, previous)
  else
    puts "No path"
  end
end

def print_path(a, b, previous)
  s = b.value
  until b.value == a.value
    b = previous[b]
    s.insert(0, "#{b.value} -> ")
  end
  return s
end

puts find_path(start, ba)
