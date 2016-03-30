class Node
  attr_accessor :score, :name, :left, :right

  def initialize(score = nil, name = nil, left_next = nil, right_next = nil)
    @score = score
    @name = name
    @left = left
    @right = right
  end

#  def <=>(otherNode)
#    @score <=> otherNode.score
#  end

  def to_s
    "[score: #{@score} name: #{@name} left=> #{@left} right=> #{@right}]"
  end
end
