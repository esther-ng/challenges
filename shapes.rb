
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
# image = [
#   [1, 0, 1, 1, 1, 1, 1],
#   [1, 0, 0, 1, 0, 1, 1],
#   [1, 1, 1, 0, 0, 0, 1],
#   [1, 0, 1, 1, 0, 1, 1],
#   [1, 0, 1, 1, 1, 1, 1],
#   [1, 0, 0, 0, 0, 1, 1],
#   [1, 1, 1, 0, 0, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
# ];


def coord(image)
  coordinates = []
  image.each_with_index do |row, i|
    row.each_with_index do |pixel, j|
      shape = {}
      if (pixel == 0) && (image[i - 1][j] == 1) && (image[i][j-1] == 1)
        shape[[i, j]] = true
        shape[find_end([i, j], image)] = true
        coordinates << shape
      end
    end
  end
  return coordinates.map { |a| a.keys }
end

def find_end(coordinates, image)
  i, j = coordinates[0], coordinates[1]
  until (j == image[i].length - 1) || (image[i][j + 1] == 1)
   j += 1
  end #5
  until (i == image.length - 1) || image[i + 1][j] == 1
    i += 1
  end #
  return [i, j]
end

coord(image)
#
# Your previous Python 3 content is preserved below:
#
# # Imagine we have an image. We’ll represent this image as a simple 2D array where every pixel is a 1 or a 0. The image you get is known to have a single rectangle of 0s on a background of 1s. Write a function that takes in the image and returns the coordinates of the rectangle -- either top-left and bottom-right; or top-left, width, and height.
#
