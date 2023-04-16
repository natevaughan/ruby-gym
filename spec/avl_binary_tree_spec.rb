require_relative '../workouts/avl_binary_tree'
require_relative '../workouts/binary_node'
require_relative '../workouts/binary_tree_utils'

describe AVLBinaryTree do
  describe "#insert" do
    it "should result in a balanced tree with a sequential array" do
      tree = AVLBinaryTree.new([1, 2, 3, 4, 5])
      expect(tree.root.value).to eq(3)
      expect(tree.root.right.value).to eq(4)
    end

    it "should result in a balanced tree with a sequential array" do
      tree = AVLBinaryTree.new([5, 4, 3, 2, 1])
      expect(tree.root.value).to eq(5) # todo fixme
    end

    it "should build a balanced tree with a large dataset" do
      tree = AVLBinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

      expect(BinaryTreeUtils::find_depth(tree.root)).to eq(6) # todo fixme
    end
  end

  describe "#rotate_right" do
    it "should result in a balanced tree" do
      root = BinaryNode.new(3)
      child = BinaryNode.new(2)
      root.left = child
      grandchild = BinaryNode.new(1)
      child.left = grandchild
      greatgrandchild = BinaryNode.new(0)
      grandchild.left = greatgrandchild
      tree = AVLBinaryTree.new([])
      tree.rotate_right(root)
      expect(child.balance_factor).to eq(0)
      expect(grandchild.balance_factor).to eq(0)
      expect(greatgrandchild.balance_factor).to eq(0)
    end
  end

  describe "#rotate_left" do
    it "should result in a balanced tree" do
      root = BinaryNode.new(1)
      child = BinaryNode.new(2)
      root.right = child
      grandchild = BinaryNode.new(3)
      child.right = grandchild
      greatgrandchild = BinaryNode.new(4)
      grandchild.right = greatgrandchild
      tree = AVLBinaryTree.new([])
      tree.rotate_left(root)
      expect(child.balance_factor).to eq(0)
      expect(grandchild.balance_factor).to eq(0)
      expect(greatgrandchild.balance_factor).to eq(0)
    end
  end
end
