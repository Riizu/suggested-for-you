require_relative 'node'

class BinarySearchTree
  attr_accessor :head, :left_node, :right_node
  
  def initialize
    @head = nil
    @left_node = nil
    @right_node = nil
  end

  def insert(score, name)
    if @head == nil
      @head = Node.new(score, name)
    elsif @left_node == nil
      @left_node = Node.new(score, name)
    elsif @right_node == nil
      @right_node = Node.new(score, name)
    end
  end

end

tree = BinarySearchTree.new
