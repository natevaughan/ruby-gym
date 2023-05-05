require_relative './trie_node'

class Trie
  def initialize
    @children = {}
  end

  def add(str)
    return unless str && str != ''
    add_internal(str, @children)
  end

  def has(str)
    has_internal(str, @children)
  end

  def size
    @children.size
  end

  private
  def has_internal(str, hash)
    key = nearest_key(str, hash)
    if hash[key].is_a?(String) && hash[key] == str
      true
    elsif hash[key].is_a?(Hash)
      has_internal(str, hash[key])
    else
      false
    end
  end

  def add_internal(str, hash)
    return unless str
    key = nearest_key(str, hash)
    if key
    else
      hash[str] = str
    end
  end

  def nearest_key(str, hash)
    if hash.has_key? str
      str
    elsif hash.has_key? str[0]
      str[0]
    else
      nil
    end
  end
end