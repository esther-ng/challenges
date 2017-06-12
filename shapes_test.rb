gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'karat'

class KaratTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:image) {
    image = [
      [0, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 0, 0, 0, 0],
      [1, 0, 1, 0, 0, 0, 0],
      [1, 0, 1, 1, 1, 1, 1],
      [1, 0, 1, 0, 0, 1, 1],
      [1, 1, 1, 0, 0, 1, 1],
      [1, 1, 1, 0, 0, 1, 1],
    ]
  }
  def test_coord
    response = [[0, 0], [0, 0], [2, 3], [3, 6], [3, 1], [5, 1], [5, 3], [7, 4]]
    assert_equal response, coord(image)
  end

end
