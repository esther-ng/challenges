class Heap
  attr_accessor :elements

  def initialize
      @elements = [0, 1]
  end

  def size
    @elements.size
  end

  def root
    @elements[1]
  end

  def swap(a, b)
    @elements[a], @elements[b] = @elements[b], @elements[a]
  end

  def <<(element)
    @elements << element
    bubble_up(@elements.size - 1)
  end

  def pop
    swap(1, @elements.size - 1)
    root = @elements.pop
    bubble_down(1)
    root
  end

  def in_order(root)
    return if root.nil?
    index = 1
    until index >= size
      index * 2
    end
    print @elements[index]
    print @elements[index/2]
    print @elements[index + 1]
    in_order(root.left)
    print "#{root.val} "
    in_order(root.right)
  end

  def next_left
    current = @root
    until current.left.nil?
      current = current.left
    end
    current
  end

  def next_right
    current = @root
    until current.right.nil?
      current = current.right
    end
    current
  end

  def insert(arr) # [[2, 3], [4, -1], [5, -1], [-1, -1], [-1, -1]]
    go_left = true
    set_children(@root, arr.first)
    arr[1..-1].each do |a|
      if go_left
        set_children(next_left, a)
        go_left = false
      else
        set_children(next_right, a)
        go_left = true
      end
    end
  end

  def set_children(root, arr)
    unless arr[0] == "-1"
      root.left = Node.new(arr[0])
    end
    unless arr[1] == "-1"
      root.right = Node.new(arr[1])
    end
  end

  def swap_children(level, root)
    return if root.nil?
    if level == 1
      temp = root.left
      root.left = root.right
      root.right = temp
    else
      level -= 1
      swap_children(level, root.left)
      swap_children(level, root.right)
    end
  end
end

nodes = gets.chomp.to_i

tree = Tree.new

ui = []
nodes.times do
  ui << gets.chomp.split(' ')
end

tree.insert(ui)
puts tree.in_order(tree.root)

levels = gets.chomp.to_i

levels.times do
  level = gets.chomp.to_i
  tree.swap_children(level, tree.root)
  puts tree.in_order(tree.root)
end
