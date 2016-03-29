require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_search_tree'
require_relative 'node'

class SuggestedForYouTest < Minitest::Test
  def test_BST_exists
    tree = BinarySearchTree.new

    assert tree
  end
end
