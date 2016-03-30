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

  def insert(score, name, tnode=@head)
    if @head.nil?
      @head = Node.new(score, name)
    elsif tnode.nil?
      tnode = Node.new(score, name)
    elsif score < tnode.score
      tnode.left = insert(score, name, tnode.left)
    elsif score > tnode.score
      tnode.right = insert(score, name, tnode.right)
    end
  end

end

tree = BinarySearchTree.new
binding.pry
