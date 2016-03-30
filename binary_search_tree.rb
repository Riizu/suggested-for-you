require_relative 'node'
require 'pry'
class BinarySearchTree
  attr_accessor :head, :left_node, :right_node

  def initialize(head = nil)
    @head = head
  end

  def search(score, tnode=@head)
    if score == tnode.score
      tnode
    elsif score < tnode.score
      search(score,tnode.left)
    elsif score > tnode.score
      search(score,tnode.right)
    end
  end

  def insert(score,name)

  end

end

tree = BinarySearchTree.new
