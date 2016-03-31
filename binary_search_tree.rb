require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

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

  def min(current = @root)
    if current.left == nil
      return current
    else
      min(current.left)
    end
  end

  def max(current = @root)
    if current.right == nil
      return current
    else
      return max(current.right)
    end
  end

  def sort(current = @root, hash = {})
    if current.nil?
      return nil
    else
      sort(current.left,hash)
      hash[current.name] = current.score
      sort(current.right,hash)
    end
    hash
  end
end

tree = BinarySearchTree.new
