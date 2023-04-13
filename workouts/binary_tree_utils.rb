class IllegalArgumentException < StandardError
end

# AVL balanced binary tree
class BinaryTree
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
  end
end

module BinaryTreeUtils
  def self.traverse(node, arr = [])
     raise IllegalArgumentException.new("Can only traverse a binary node") unless node.is_a? BinaryNode
     if node.left != nil
       self.traverse(node.left, arr)
     end
     arr.push(node.value)
     if node.right != nil
       self.traverse(node.right, arr)
     end
     return arr
  end

  def self.find_depth(node, depth = 1)
    return depth - 1 if node == nil
    if node.left == nil && node.right == nil
      return depth
    else
      return [find_depth(node.left, depth + 1), find_depth(node.right, depth + 1)].max
    end
  end
end