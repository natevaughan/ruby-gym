

class WordCounter
  attr_reader :word_count

  def initialize(file_path)
    @file_path = file_path
    @word_count = 0
  end

  def count_words_in_file
    start_timer
    File.open(@file_path, "r") do |f|
      f.each_line do |line|
        words = line.split(/[.,\/#!$%\^&\*;:{}=\-_`~()\s]+/)
        @word_count += words.length
      end
    end
    stop_timer
  end

  def elapsed_time
    (@finish - @start) * 1000.0
  end

  private
  def start_timer
    @start = Time.now
  end

  def stop_timer
    @finish = Time.now
  end
end

FILE_NAME_PLACEHOLDER = '<!BOOK>'
FILE_NAME_TEMPLATE = "war_and_peace_book_#{FILE_NAME_PLACEHOLDER}.txt"

start = Time.now
internal_time = 0.0

(1..15).to_a.each do |n|
  total = 0
  elapsed = 0.0
  file_path = "./data/#{FILE_NAME_TEMPLATE.sub(FILE_NAME_PLACEHOLDER, n.to_s)}"
  word_counter = WordCounter.new(file_path)
  word_counter.count_words_in_file
  total += word_counter.word_count
  elapsed += word_counter.elapsed_time
  internal_time += word_counter.elapsed_time
  puts "Counted #{total} words in #{elapsed} ms"
end

finish = Time.now
puts "--------------------"
puts "Simple run took #{(finish - start) * 1000.0} ms with #{internal_time} ms measured internally"
puts "--------------------"

start = Time.now
internal_time = 0.0
threads = []

(1..15).to_a.each do |n|
  threads << Thread.new {
    total = 0
    elapsed = 0.0
    file_path = "./data/#{FILE_NAME_TEMPLATE.sub(FILE_NAME_PLACEHOLDER, n.to_s)}"
    word_counter = WordCounter.new(file_path)
    word_counter.count_words_in_file
    total += word_counter.word_count
    elapsed += word_counter.elapsed_time
    internal_time += word_counter.elapsed_time
    puts "Counted #{total} words in #{elapsed} ms"
  }
end

threads.each(&:join)

finish = Time.now
puts "--------------------"
puts "Threaded run took #{(finish - start) * 1000.0} ms with #{internal_time} ms measured internally"
puts "--------------------"
