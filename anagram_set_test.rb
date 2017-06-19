gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'anagram_set'

class AnagramSetTest < Minitest::Test
  extend Minitest::Spec::DSL

  let(:input) {
    %w(pool snail sand polo loop nails)
  }

  def test_anagrams
    assert_equal 3, anagram_set(input)
  end
end
