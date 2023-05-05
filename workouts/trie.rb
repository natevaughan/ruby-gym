require_relative './trie_node'

class Trie
  def initialize
    @children = {}
  end

  def add(str)
    return unless str
    key = nearest_key(str)
    if key
    else
      @children[str] = true
    end
  end

  def has(str)
    nearest_key(str) != nil
  end

  def size
    @children.size
  end

  private
  def nearest_key(str)
    if @children.has_key? str
      str
    elsif @children.has_key? str[0]
      str[0]
    else
      nil
    end
  end
end