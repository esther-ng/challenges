
# image = [
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 0, 0, 0, 1],
#   [1, 1, 1, 0, 0, 0, 1],
#   [1, 1, 1, 1, 1, 1, 1],
# ];

# image = [
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 0, 0, 0, 1],
#   [1, 0, 1, 0, 0, 0, 1],
#   [1, 0, 1, 1, 1, 1, 1],
#   [1, 0, 1, 0, 0, 1, 1],
#   [1, 1, 1, 0, 0, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
# ];

# image = [
#   [0, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 0, 0, 0, 0],
#   [1, 0, 1, 0, 0, 0, 0],
#   [1, 0, 1, 1, 1, 1, 1],
#   [1, 0, 1, 0, 0, 1, 1],
#   [1, 1, 1, 0, 0, 1, 1],
#   [1, 1, 1, 0, 0, 1, 1],
# ];


 # There are N shapes made up of 0s in the image. They are not necessarily rectangles -- they are odd shapes (“islands”). Find them.
image = [
  [1, 0, 1, 1, 1, 1, 1],
  [1, 0, 0, 1, 0, 1, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 0, 1, 1, 0, 1, 1],
  [1, 0, 1, 1, 1, 1, 1],
  [1, 0, 0, 0, 0, 1, 1],
  [1, 1, 1, 0, 0, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
]

class Shape
  # attr_accessor :image, :visited, :shapes, :neighbors

  def initialize(image)
    @image = image
    @visited = {}
    @shapes = []
    @neighbors = []
  end

  def find_shapes
    @image.each_with_index do |row, i|
      row.each_with_index do |pixel, j|
        if shape_start?(i, j)
          @shapes << define_shape(i, j)
        end
      end
    end
    return @shapes
  end

  private

  def shape_start?(i, j)
    (@image[i][j] == 0) && !@visited[[i,j]]
    # (i == 0 || image[i - 1][j] == 1) && (j == 0 || image[i][j-1] == 1)
  end

  def add_neighbors(i, j)
    @neighbors << [i, j + 1] unless @visited[[i, j + 1]]
    @neighbors << [i + 1, j] unless @visited[[i + 1, j]]
    @neighbors << [i, j - 1] unless @visited[[i, j - 1]]
    @neighbors << [i - 1, j] unless @visited[[i - 1, j]]
    # @neighbors.uniq!
  end

  def define_shape(i, j)
    @visited[[i,j]] = true
    shape = [[i,j]]
    add_neighbors(i, j)

    until @neighbors.empty?
      current = @neighbors.delete_at(0)
      puts "current >>>>> #{current}"
      a, b = current
      if @image[a][b] == 0 && !@visited[current]
        shape << current
        add_neighbors(a, b)
        @visited[current] = true
      end
    end
    # shape[[i,j]] = true
    # go right


    #
    # until (j == @image[i].length - 1) || @image[i, j] == 1
    #   unless @visited[i,j]
    #
    #     shape << [i,j]
    #   end
    #   j += 1
    # end
    #
    # i, j = shape.first
    #
    #
    #
    # until (j == image[i].length - 1) || (image[i][j + 1] == 1)
    #   shape << [i, j]
    #   j += 1
    # end #5
    # until (i == image.length - 1) || image[i + 1][j] == 1
    #   shape << [i, j]
    #   i += 1
    # end #
    return shape
  end

end

shape = Shape.new(image)
print shape.find_shapes.to_s
#
# Your previous Python 3 content is preserved below:
#
# # Imagine we have an image. We’ll represent this image as a simple 2D array where every pixel is a 1 or a 0. The image you get is known to have a single rectangle of 0s on a background of 1s. Write a function that takes in the image and returns the coordinates of the rectangle -- either top-left and bottom-right; or top-left, width, and height.
#
