require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :head

  def include?(score, tnode=@head)
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
    if @head.nil?
      @head = Node.new(score,name)
      return @head.depth
    else
      @head.insert(score,name)
    end
  end

  def depth_of(score, tnode=@head, depth=0)
    if tnode.nil?
      return false
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
