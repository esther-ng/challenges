gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'highway'

class HighwayTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:a) {
    [6, 8, 9, 10, 14, 15]
  }
  let(:b) {
    [1, 5, 6, 7, 9, 10, 12, 13]
  }

  # Northbound Southbound Average Speed


  def test_highway
    assert_equal [], highway(a, b)
  end

end
