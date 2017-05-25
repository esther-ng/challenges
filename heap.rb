class Heap
  attr_accessor :elements

  def initialize
      @elements = [0]
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
end

class MaxHeap < Heap
  def bubble_up(index)
    parent_index = index/2
    return if index == 1
    return if @elements[parent_index] >= @elements[index]
    swap(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = index * 2
    return if child_index > @elements.size - 1

    not_last = child_index < @elements.size - 1
    left = @elements[child_index]
    right= @elements[child_index + 1]
    child_index += 1 if not_last && right > left

    return if @elements[index] >= @elements[child_index]

    swap(index, child_index)

    bubble_down(child_index)
  end
end

class MinHeap < Heap
  def bubble_up(index)
    parent_index = index/2
    return if index == 1
    return if @elements[parent_index] <= @elements[index]
    swap(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = index * 2
    return if child_index > @elements.size - 1

    not_last = child_index < @elements.size - 1
    left = @elements[child_index]
    right= @elements[child_index + 1]
    child_index += 1 if not_last && right < left

    return if @elements[index] <= @elements[child_index]

    swap(index, child_index)

    bubble_down(child_index)
  end
end
