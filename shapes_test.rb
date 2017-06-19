gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'shapes'

class ShapesTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:image) {
    [
      [0, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 0, 0, 0, 0],
      [1, 0, 1, 0, 0, 0, 0],
      [1, 0, 1, 1, 1, 1, 1],
      [1, 0, 1, 0, 0, 1, 1],
      [1, 1, 1, 0, 0, 1, 1],
      [0, 1, 1, 0, 0, 1, 1],
    ]
  }

  let (:shapes) {
    [
      [1, 0, 1, 1, 1, 1, 1],
      [1, 0, 0, 1, 0, 1, 1],
      [1, 1, 1, 0, 0, 0, 1],
      [1, 0, 1, 1, 0, 1, 1],
      [1, 0, 1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0, 1, 1],
      [1, 1, 1, 0, 0, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ]
  }
  # def test_coord
  #   response = [[0, 0], [0, 0], [2, 3], [3, 6], [3, 1], [5, 1], [5, 3], [7, 4]]
  #   assert_equal response, coord(image)
  # end
  let(:shape) {
    Shape.new(shapes)
  }
  def test_shapes
    response = [[[0, 1], [1, 1], [1, 2]], [[1, 4], [2, 4], [2, 5], [3, 4], [2, 3]], [[3, 1], [4, 1], [5, 1], [5, 2], [5, 3], [5, 4], [6, 3], [6, 4]]]
    assert_equal response, shape.find_shapes
  end

end
