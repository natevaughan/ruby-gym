class IllegalArgumentException < StandardError
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

  def self.contains(node, value)
    raise IllegalArgumentException.new("Can only traverse a binary node") unless node.is_a? BinaryNode
    return (node.value == value) ||
      (node.left != nil && self.contains(node.left, value)) ||
      (node.right != nil && self.contains(node.right, value))
  end

  def self.find_depth(node, depth = 1)
    return depth - 1 if node == nil
    if node.left == nil && node.right == nil
      return depth
    else
      return [find_depth(node.left, depth + 1), find_depth(node.right, depth + 1)].max
    end
  end

  def self.leaf_nodes(tree)
    raise IllegalArgumentException.new("Can only find leaf nodes in a BinaryTree") unless tree.is_a? BinaryTree
    return self.find_leaves(tree.root, [])
  end

  private
  def self.find_leaves(node, accumulator)
    if node.left == nil && node.right == nil
      accumulator << node.value
    else
      if node.left != nil
        find_leaves(node.left, accumulator)
      end
      if node.right != nil
        find_leaves(node.right, accumulator)
      end
    end
    accumulator
  end
end