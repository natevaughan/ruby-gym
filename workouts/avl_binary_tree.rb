require_relative './binary_tree'

class AVLBinaryTree < BinaryTree
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

    if @root.balance_factor < -1
      old_root = @root
      @root = old_root.left
      @root.left_depth = old_root.left_depth
      old_root.left = @root.right
      old_root.left_depth = @root.right_depth
      @root.right = old_root
      @root.right_depth = [old_root.left_depth, old_root.right_depth].max + 1
    elsif @root.balance_factor > 1
      old_root = @root
      @root = old_root.right
      @root.right_depth = old_root.right_depth
      old_root.right = @root.left
      old_root.right_depth = @root.left_depth
      @root.left = old_root
      @root.left_depth = [old_root.left_depth, old_root.right_depth].max + 1
    end
  end

  def insert(value, node)
    return unless node != nil

    if value < node.value
      if node.left == nil
        node.left = BinaryNode.new(value)
        node.left_depth = 1
      else
        node.left_depth = insert(value, node.left)
      end
    else
      if node.right == nil
        node.right = BinaryNode.new(value)
        node.right_depth = 1
      else
        node.right_depth = insert(value, node.right)
      end
    end

    if node.left != nil && node.left.balance_factor < -1
      rotate_right(node)
    end

    if node.right != nil && node.right.balance_factor > 1
      rotate_left(node)
    end

    [node.left_depth, node.right_depth].max + 1
  end

  def rotate_right(parent)
    child = parent.left
    parent.left = child.left
    parent.left_depth = child.left_depth
    child.left = parent.right
    child.left_depth = parent.right_depth
    parent.left.right = child
  end

  def rotate_left(parent)
    child = parent.right
    parent.right = child.right
    parent.right_depth = child.right_depth
    child.right = parent.left
    child.right_depth = parent.left_depth
    parent.right.left = child
    parent.right.left_depth = [child.left_depth, child.right_depth].max + 1
  end
end