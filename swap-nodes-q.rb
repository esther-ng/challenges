class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root

  def initialize
    @root = Node.new(1)
    @q = [@root]
  end

  def in_order(root)
    return if root.nil?
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
    arr.each do |a|
      parent = @q.shift
      set_children(parent, a)
    end
  end

  def set_children(root, arr)
    unless arr[0] == "-1"
      root.left = Node.new(arr[0])
      @q << root.left
    end
    unless arr[1] == "-1"
      root.right = Node.new(arr[1])
      @q << root.right
    end
  end

  def height(root)
    if root.nil?
        return 0
    else
        [height(root.left), height(root.right)].max + 1
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
# puts tree.in_order(tree.root)

levels = gets.chomp.to_i

levels.times do
  level = gets.chomp.to_i
  height = tree.height(tree.root)
  until level >= height
    tree.swap_children(level, tree.root)
    level += 2
  end
  puts tree.in_order(tree.root)
end
