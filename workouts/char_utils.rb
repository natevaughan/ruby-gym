
module CharUtils
  def self.first_non_repeated_char(str)
    char_counts = {}
    str.each_char do |c|
      if char_counts[c] == nil
        char_counts[c] = 1
      else
        char_counts[c] += 1
      end
    end

    str.each_char do |c|
      if char_counts[c] == 1
        return c
      end
    end

    return nil
  end
end
