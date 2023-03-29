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
      root_node = BinaryTreeUtils::construct([1])
      expect(root_node.value).to eq(1)
      expect(root_node.left).to be_nil
      expect(root_node.right).to be_nil
    end

    it "builds a tree of depth 2" do
      root_node = BinaryTreeUtils::construct([2, 1, 4])
      expect(root_node.value).to eq(2)
      expect(root_node.left.value).to eq(1)
      expect(root_node.right.value).to eq(4)
    end

    it "expects argument to be a TreeNode" do
      expect { BinaryTreeUtils::construct("illegal argument") }.to raise_error(IllegalArgumentException)
    end
  end
end