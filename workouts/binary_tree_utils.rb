class IllegalArgumentException < StandardError
end

class BinaryNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
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

  def self.construct(arr)
    raise IllegalArgumentException.new("Can only build a binary tree from an array") unless arr.is_a? Array
    root_node = nil
    arr.each do |el|
      if root_node == nil
        root_node = BinaryNode.new(el)
      else
        insert_node(el, root_node)
      end
    end
    return root_node
  end

  def self.insert_node(value, node)
    if value < node.value
      if node.left == nil
        node.left = BinaryNode.new(value)
      else
        insert_node(value, node.left)
      end
    else
      if node.right == nil
        node.right = BinaryNode.new(value)
      else
        insert_node(value, node.right)
      end
    end
  end
end