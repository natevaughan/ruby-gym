require_relative '../workouts/trie'

describe Trie do
  describe "#add" do
    it "handles nil strings" do
      trie = Trie.new
      trie.add nil
      expect(trie.size).to eq(0)
    end

    it "handles empty strings" do
      trie = Trie.new
      trie.add ""
      expect(trie.size).to eq(0)
    end
  end

  describe "#has" do
    it "has a single-letter word" do
      trie = Trie.new
      trie.add 'a'
      expect(trie.has('a')).to be_truthy
    end

    it "does not have a word not added" do
      trie = Trie.new
      trie.add 'a'
      expect(trie.has('b')).to be_falsey
    end

    it "does not have a word starting with one it does have" do
      trie = Trie.new
      trie.add 'a'
      expect(trie.has('ab')).to be_falsey
    end

    it "adds multi-letter words" do
      trie = Trie.new
      trie.add 'ab'
      trie.add 'aa'
      expect(trie.has('ab')).to be_truthy
      expect(trie.has('aa')).to be_truthy
    end
  end
end