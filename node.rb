class Node
  attr_accessor :score, :name, :left, :right, :depth

  def initialize(score, name, depth=0, left=nil, right=nil)
    @score = score
    @name = name
    @depth = depth
    @left = left
    @right = right
  end

  def insert(score, name, depth=1)
    if score <= @score
      if @left.nil?
        @left = Node.new(score,name,depth)
        @left.depth
      else
        @left.insert(score,name,depth+1)
      end
    elsif score >= @score
      if @right.nil?
        @right = Node.new(score,name,depth)
        @right.depth
      else
        @right.insert(score,name,depth+1)
      end
    end
  end

  def to_s
    "[score: #{@score} name: #{@name} depth: #{@depth}]"
  end
end
