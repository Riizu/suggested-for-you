require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_search_tree'
require_relative 'node'

class SuggestedForYouTest < Minitest::Test
  def test_BST_exists
    tree = BinarySearchTree.new

    assert tree
  end

  def test_insert_first_node
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, tree.head.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.head.name
  end
end
