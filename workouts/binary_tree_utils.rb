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

  def self.find_depth(node, depth = 1)
    return depth - 1 if node == nil
    if node.left == nil && node.right == nil
      return depth
    else
      return [find_depth(node.left, depth + 1), find_depth(node.right, depth + 1)].max
    end
  end
end