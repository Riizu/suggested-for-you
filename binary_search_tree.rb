require_relative 'node'
require 'pry'
class BinarySearchTree
  attr_accessor :head, :left_node, :right_node

  def include?(score, tnode=@head)
    if tnode.nil?
      return false
    elsif score == tnode.score
      return true
    elsif score < tnode.score
      search(score,tnode.left)
    else score > tnode.score
      search(score,tnode.right)
    end
  end

  def insert(score, name)

  end

end

tree = BinarySearchTree.new
binding.pry
