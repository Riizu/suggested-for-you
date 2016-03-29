class Node
  attr_accessor :score, :name, :next_node

  def initialize(score, name)
    @score = score
    @name = name
    @next_node = nil
  end

end
