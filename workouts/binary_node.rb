
class BinaryNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def balance_factor
    if @left == nil && @right != nil
      1
    elsif @right == nil && @left != nil
      -1
    else
      0
    end
  end
end