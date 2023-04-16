

class AVLBinaryTree
  attr_reader :root

  def initialize(arr)
    @root = nil
    return if arr == nil
    raise IllegalArgumentException.new("Can only create a binary tree from an array") unless arr&.is_a? Array
    arr.each { | el | add(el) }
  end

  def add(value)
    if @root == nil
      @root = BinaryNode.new(value)
    else
      insert(value, @root)
    end

    if @root.balance_factor == -1 && @root.left.balance_factor == 11
      old_root = @root
      @root = old_root.left
    elsif @root.balance_factor == 1 && @root.right.balance_factor == -1
      old_root = @root
      @root = old_root.right
    end
  end

  def insert(value, node)
    return unless node != nil

    if value < node.value
      if node.left == nil
        node.left = BinaryNode.new(value)
      else
        insert(value, node.left)
      end
    else
      if node.right == nil
        node.right = BinaryNode.new(value)
      else
        insert(value, node.right)
      end
    end

    if node.balance_factor == -1 && node.left&.balance_factor == -1
      rotate_right(node)
    end

    if node.balance_factor == 1 && node.right&.balance_factor == 1
      rotate_left(node)
    end
  end

  def rotate_right(parent)
    child = parent.left
    parent.left = child.left
    child.left = nil
    parent.left.right = child
  end

  def rotate_left(parent)
    child = parent.right
    parent.right = child.right
    child.right = nil
    parent.right.left = child
  end
end