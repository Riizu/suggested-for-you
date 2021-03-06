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

    max = tree.max
    expected_max = {"Sharknado 3" => 92}
    assert_equal expected_max, max
  end

  def test_min
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    min = tree.min
    expected_min = {"Johnny English" => 16}
    assert_equal expected_min, min
  end

  def test_sort
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    sort = {"Johnny English" => 16, "Hannibal Buress: Animal Furnace" => 50,
            "Bill & Ted's Excellent Adventure" => 61, "Sharknado 3" => 92}

    assert_equal sort, tree.sort
  end

  def test_load
    tree = BinarySearchTree.new

    tree.load("movies.txt")
    sort = tree.sort

    assert tree.include?(71)
    assert tree.include?(69)
    assert tree.include?(39)
  end

  def test_health
    tree = BinarySearchTree.new

    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    binding.pry

    health0 = tree.health(0)
    health1 = tree.health(1)
    health2 = tree.health(2)

    assert_equal health0, [[98, 7, 100]]
    assert_equal health1, [[58, 6, 85]]
    assert_equal health2, [[36, 2, 28], [93, 3, 42]]
  end
end
