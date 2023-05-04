require_relative '../workouts/char_utils'

describe CharUtils do
  describe "first_non_repeated_char" do
    it "returns the letter in a one-letter string" do
      expect(CharUtils::first_non_repeated_char("a")).to eq("a")
    end

    it "returns nil in an empty string" do
      expect(CharUtils::first_non_repeated_char("")).to be_nil
    end

    it "returns nil in a string with all repeated characters" do
      expect(CharUtils::first_non_repeated_char("aa")).to be_nil
    end

    it "returns the first non repeated char 1" do
      expect(CharUtils::first_non_repeated_char("abcdabc")).to eq("d")
    end

    it "returns the first non repeated char 2" do
      expect(CharUtils::first_non_repeated_char("abfcdedabdaee")).to eq("f")
    end

    it "returns the first non repeated when a string has lots of other chars" do
      expect(CharUtils::first_non_repeated_char("aaaaayaaaaa")).to eq("y")
    end
  end
end
