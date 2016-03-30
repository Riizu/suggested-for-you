require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'binary_search_tree'
require_relative 'node'

class SuggestedForYouTest < Minitest::Test
  def test_BST_exists
    tree = BinarySearchTree.new

    assert tree
  end

  def test_insert_first_node
    skip
    tree = BinarySearchTree.new

    node0 = tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, tree.head.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.head.name
  end

  def test_multiple_node_depth
    skip
    tree = BinarySearchTree.new

    node0 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    node1 = tree.insert(16, "Johnny English")
    node2 = tree.insert(92, "Sharknado 3")
    node3 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, node0
    assert_equal 1, node1
    assert_equal 1, node2
    assert_equal 2, node3
  end

  def test_multiple_node_data
    skip
    tree = BinarySearchTree.new

    node0 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    node1 = tree.insert(16, "Johnny English")
    node2 = tree.insert(92, "Sharknado 3")
    node3 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 16, tree.head.left.score
    assert_equal 92, tree.head.right.score
    assert_equal 50, tree.head.left.right.score
  end
end
