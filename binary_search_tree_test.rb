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

    tree = BinarySearchTree.new

    node0 = tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, tree.root.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.root.name
  end

  def test_multiple_node_depth

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

    tree = BinarySearchTree.new

    node0 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    node1 = tree.insert(16, "Johnny English")
    node2 = tree.insert(92, "Sharknado 3")
    node3 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 16, tree.root.left.score
    assert_equal 92, tree.root.right.score
    assert_equal 50, tree.root.left.right.score

  end

  def test_include?
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert tree.include?(61)
    refute tree.include?(20)
  end

  def test_depth_of
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    depth1 = tree.depth_of(92)
    depth2 = tree.depth_of(50)

    assert_equal 1, depth1
    assert_equal 2, depth2
  end

  def test_max
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    max = tree.max.score
    assert_equal 92, max
  end

end
