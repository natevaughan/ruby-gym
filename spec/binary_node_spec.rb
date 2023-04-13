require_relative '../workouts/binary_node'

describe BinaryNode do
  describe "#balance_factor" do
    it "returns 0 if node has no children" do
      expect(BinaryNode.new(1).balance_factor).to eq(0)
    end

    it "returns 0 if node has both left and right children" do
      root = BinaryNode.new(2)
      root.left = BinaryNode.new(1)
      root.right = BinaryNode.new(3)
      expect(root.balance_factor).to eq(0)
    end

    it "returns 1 if node has right child only" do
      root = BinaryNode.new(2)
      root.right = BinaryNode.new(3)
      expect(root.balance_factor).to eq(1)
    end

    it "returns -1 if node has left child only" do
      root = BinaryNode.new(2)
      root.right = BinaryNode.new(3)
      expect(root.balance_factor).to eq(1)
    end
  end
end