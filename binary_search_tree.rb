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
      #using in order traversal
      sort(current.left,hash)
      hash[current.name] = current.score
      sort(current.right,hash)
    end
    hash
  end

  def height(current = @root)
    if current.nil?
      return 0
    else
      lheight = height(current.left)
      rheight = height(current.right)

      if lheight > rheight
        return lheight + 1
      else
        return rheight + 1
      end
    end
  end

  def get_given_depth(depth, current = @root,array=[])
    return nil if current.nil?
    if depth == 0
      node_data = {current.score => current.name}
      array.push(node_data)
    elsif depth > 0
      get_given_depth(depth-1,current.left,array)
      get_given_depth(depth-1,current.right,array)
    end
    array
  end

  def health(depth, current = @root)
    height = height(current)
    puts height
    requested_nodes = []
    while depth <= height do
      requested_nodes << get_given_depth(depth)
      depth+=1
    end
    requested_nodes.uniq!
    health = [requested_nodes[0].score]
    puts health
  end
end

tree = BinarySearchTree.new
