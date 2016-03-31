require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def in_order(node=@root, &block)
    return if node.nil?
    in_order(node.left, &block)
    yield node
    in_order(node.right, &block)
  end

  def include?(score, tnode=@root)
    if tnode.nil?
      return false
    elsif score == tnode.score
      return true
    elsif score < tnode.score
      include?(score,tnode.left)
    else score > tnode.score
      include?(score,tnode.right)
    end
  end

  def insert(score, name)
    if @root.nil?
      @root = Node.new(score,name)
      return @root.depth
    else
      @root.insert(score,name)
    end
  end

  def depth_of(score, tnode=@root, depth=0)
    if tnode.nil?
      puts "No such node exists"
    elsif score == tnode.score
      return depth
    elsif score < tnode.score
      depth_of(score,tnode.left,depth+1)
    else score > tnode.score
      depth_of(score,tnode.right,depth+1)
    end
  end
end

tree = BinarySearchTree.new
