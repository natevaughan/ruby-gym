require_relative '../workouts/binary_tree_utils'

describe BinaryTreeUtils do
  describe "#traverse" do
    it "traverses a node of depth 1" do
      expect(BinaryTreeUtils::traverse(BinaryNode.new(1))).to eq([1])
    end

    it "traverses a node of depth 2" do
      entry_node = BinaryNode.new(2)
      entry_node.left = BinaryNode.new(1)
      entry_node.right = BinaryNode.new(4)
      expect(BinaryTreeUtils::traverse(entry_node)).to eq([1, 2, 4])
    end

    it "expects argument to be a TreeNode" do
      expect { BinaryTreeUtils::traverse("illegal argument") }.to raise_error(IllegalArgumentException)
    end
  end

  describe "#build" do
    it "builds a tree of depth 1" do
      tree = BinaryTree.new([1])
      expect(tree.root.value).to eq(1)
      expect(tree.root.left).to be_nil
      expect(tree.root.right).to be_nil
    end

    it "builds a tree of depth 2" do
      tree = BinaryTree.new([2, 1, 4])
      expect(tree.root.value).to eq(2)
      expect(tree.root.left.value).to eq(1)
      expect(tree.root.right.value).to eq(4)
    end

    it "builds a balanced tree" do
      tree = BinaryTree.new([1, 2, 3, 4])
      expect(BinaryTreeUtils::find_depth(tree.root)).to eq(4) # todo
    end

    it "expects argument to be an Array" do
      expect { BinaryTree.new("illegal argument") }.to raise_error(IllegalArgumentException)
    end
  end

  describe "#find_depth" do
    it "returns 1 for a single node tree" do
      tree = BinaryTree.new([1])
      expect(BinaryTreeUtils::find_depth(tree.root)).to eq(1)
    end

    it "returns 2 for a tree of depth 2" do
      tree = BinaryTree.new([2, 1, 4])
      expect(BinaryTreeUtils::find_depth(tree.root)).to eq(2)
    end

    it "returns 3 for a balanced tree of depth 3" do
      tree = BinaryTree.new([5,3, 2, 4, 9, 7, 100])
      expect(BinaryTreeUtils::find_depth(tree.root)).to eq(3)
    end
  end
end