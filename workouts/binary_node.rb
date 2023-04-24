
class BinaryNode
  attr_reader :value
  attr_accessor :left, :right, :left_depth, :right_depth

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
    @left_depth = 0
    @right_depth = 0
  end

  def balance_factor
    @right_depth - @left_depth
  end
end