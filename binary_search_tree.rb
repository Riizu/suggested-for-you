require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def include?(score, current=@root)
    if current.nil?
      return false
    elsif score == current.score
      return true
    elsif score < current.score
      include?(score,current.left)
    else score > current.score
      include?(score,current.right)
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

  def depth_of(score, current=@root, depth=0)
    if current.nil?
      puts "No such node exists"
    elsif score == current.score
      return depth
    elsif score < current.score
      depth_of(score,current.left,depth+1)
    else score > current.score
      depth_of(score,current.right,depth+1)
    end
  end

  def min(current = @root, hash = {})
    if current.left == nil
      hash[current.name] = current.score
      hash
    else
      min(current.left)
    end
  end

  def max(current = @root, hash = {})
    if current.right == nil
      hash[current.name] = current.score
      hash
    else
      return max(current.right)
    end
  end

  def load(file)
    file = File.open(file)
    while !file.eof?
      line = file.readline.split(",", 2)
      score = line[0].to_i
      name = line[1]
      insert(score, name)
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
