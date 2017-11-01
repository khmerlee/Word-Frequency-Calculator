#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  attr_accessor: :highest_wf_count, :highest_wf_words, :content, :line_number

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

    def initialized(content, line_number) #constructor
      self.highest_wf_words =[]
      self.content = content
      self.line_number = line_number
      calculate_word_frequency
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.

  def calculate_word_frequency
    word_frequency = Hash.new(0)
    self.content.split.each do |word|
      word_frequency[word.downcase] +=1
    end
    self.highest_wf_count = word_frequency.values.max
    self.highest_wf_words = word_frequency.select {|k, v| v== highest_wf_count}.keys
    
    end
end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  attr_accessor :highest_count_across_lines, :highest_count_words_across_lines, :analyzers
  def initialise #constructor
      self.analyzers = Array.new
  end
  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

   def analyze_file
    if File.exist? 'test.txt'
      File.foreach( 'test.txt' ) do |line|
        self.analyzers << LineAnalyzer.new(line.chomp, $.)
      end
    end
  end

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

 def calculate_line_with_highest_frequency
    self.highest_count_words_across_lines = []
    self.analyzers.max_by do |analyzer|
      self.highest_count_across_lines = analyzer.highest_wf_count
    end
    self.highest_count_words_across_lines += self.analyzers.select { |item| item.highest_wf_count == self.highest_count_across_lines }
  end
  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format

    def print_highest_word_frequency_across_lines
    self.analyzers.each do |analyzer|
      puts "#{analyzer.highest_wf_words} (appears in line #{analyzer.line_number})" if self.highest_count_across_lines == analyzer.highest_wf_count
    end
  end
  
end





#["\n", "LineAnalyzer\n", "  has accessor for highest_wf_count (FAILED - 1)\n", "  has accessor for highest_wf_words (FAILED - 2)\n", "  has accessor for content (FAILED - 3)\n", "  has accessor for line_number (FAILED - 4)\n", "  has method calculate_word_frequency (FAILED - 5)\n", "  calls calculate_word_frequency when created (FAILED - 6)\n", "  attributes and values\n", "    has attributes content and line_number (FAILED - 7)\n", "    content attribute (FAILED - 8)\n", "    line_number attribute (FAILED - 9)\n", "  #calculate_word_frequency\n", "    highest_wf_count value is 3 (FAILED - 10)\n", "    highest_wf_words check (FAILED - 11)\n", "    content attribute will have expected value (FAILED - 12)\n", "    line_number attribute (FAILED - 13)\n", "\n", "Solution\n", "  should respond to #analyze_file (FAILED - 14)\n", "  should respond to #calculate_line_with_highest_frequency (FAILED - 15)\n", "  should respond to #print_highest_word_frequency_across_lines (FAILED - 16)\n", "  #analyze_file\n", "    creates 3 line analyzers (FAILED - 17)\n", "  #calculate_line_with_highest_frequency\n", "    calculates highest count across lines to be 4 (FAILED - 18)\n", "    calculates highest count words across lines to be will, it, really (FAILED - 19)\n", "\n", "Failures:\n", "\n", "  1) LineAnalyzer has accessor for highest_wf_count\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:9:in `block (2 levels) in <top (required)>'\n", "\n", "  2) LineAnalyzer has accessor for highest_wf_words\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:12:in `block (2 levels) in <top (required)>'\n", "\n", "  3) LineAnalyzer has accessor for content\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:15:in `block (2 levels) in <top (required)>'\n", "\n", "  4) LineAnalyzer has accessor for line_number\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:18:in `block (2 levels) in <top (required)>'\n", "\n", "  5) LineAnalyzer has method calculate_word_frequency\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:21:in `block (2 levels) in <top (required)>'\n", "\n", "  6) LineAnalyzer calls calculate_word_frequency when created\n", "     Failure/Error: expect_any_instance_of(LineAnalyzer).to receive(:calculate_word_frequency)\n", "       LineAnalyzer does not implement #calculate_word_frequency\n", "     # ./spec/line_analyzer_spec.rb:36:in `block (2 levels) in <top (required)>'\n", "\n", "  7) LineAnalyzer attributes and values has attributes content and line_number\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:25:in `block (3 levels) in <top (required)>'\n", "\n", "  8) LineAnalyzer attributes and values content attribute\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:28:in `block (3 levels) in <top (required)>'\n", "\n", "  9) LineAnalyzer attributes and values line_number attribute\n", "     Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"test\", 1) }\n", "\n", "     ArgumentError:\n", "       wrong number of arguments (2 for 0)\n", "     # ./spec/line_analyzer_spec.rb:6:in `initialize'\n", "     # ./spec/line_analyzer_spec.rb:6:in `new'\n", "     # ./spec/line_analyzer_spec.rb:6:in `block (2 levels) in <top (required)>'\n", "     # ./spec/line_analyzer_spec.rb:31:in `block (3 levels) in <top (required)>'\n", "\n", "  10) LineAnalyzer#calculate_word_frequency highest_wf_count value is 3\n", "      Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"This is a really really really cool cool you you you\", 2) }\n", "\n", "      ArgumentError:\n", "        wrong number of arguments (2 for 0)\n", "      # ./spec/line_analyzer_spec.rb:41:in `initialize'\n", "      # ./spec/line_analyzer_spec.rb:41:in `new'\n", "      # ./spec/line_analyzer_spec.rb:41:in `block (3 levels) in <top (required)>'\n", "      # ./spec/line_analyzer_spec.rb:44:in `block (3 levels) in <top (required)>'\n", "\n", "  11) LineAnalyzer#calculate_word_frequency highest_wf_words check\n", "      Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"This is a really really really cool cool you you you\", 2) }\n", "\n", "      ArgumentError:\n", "        wrong number of arguments (2 for 0)\n", "      # ./spec/line_analyzer_spec.rb:41:in `initialize'\n", "      # ./spec/line_analyzer_spec.rb:41:in `new'\n", "      # ./spec/line_analyzer_spec.rb:41:in `block (3 levels) in <top (required)>'\n", "      # ./spec/line_analyzer_spec.rb:47:in `block (3 levels) in <top (required)>'\n", "\n", "  12) LineAnalyzer#calculate_word_frequency content attribute will have expected value\n", "      Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"This is a really really really cool cool you you you\", 2) }\n", "\n", "      ArgumentError:\n", "        wrong number of arguments (2 for 0)\n", "      # ./spec/line_analyzer_spec.rb:41:in `initialize'\n", "      # ./spec/line_analyzer_spec.rb:41:in `new'\n", "      # ./spec/line_analyzer_spec.rb:41:in `block (3 levels) in <top (required)>'\n", "      # ./spec/line_analyzer_spec.rb:50:in `block (3 levels) in <top (required)>'\n", "\n", "  13) LineAnalyzer#calculate_word_frequency line_number attribute\n", "      Failure/Error: subject(:lineAnalyzer) { LineAnalyzer.new(\"This is a really really really cool cool you you you\", 2) }\n", "\n", "      ArgumentError:\n", "        wrong number of arguments (2 for 0)\n", "      # ./spec/line_analyzer_spec.rb:41:in `initialize'\n", "      # ./spec/line_analyzer_spec.rb:41:in `new'\n", "      # ./spec/line_analyzer_spec.rb:41:in `block (3 levels) in <top (required)>'\n", "      # ./spec/line_analyzer_spec.rb:53:in `block (3 levels) in <top (required)>'\n", "\n", "  14) Solution should respond to #analyze_file\n", "      Failure/Error: it { is_expected.to respond_to(:analyze_file) }\n", "        expected #<Solution:0x00000001802f18> to respond to :analyze_file\n", "      # ./spec/solution_spec.rb:8:in `block (2 levels) in <top (required)>'\n", "\n", "  15) Solution should respond to #calculate_line_with_highest_frequency\n", "      Failure/Error: it { is_expected.to respond_to(:calculate_line_with_highest_frequency) }\n", "        expected #<Solution:0x000000018bf9b0> to respond to :calculate_line_with_highest_frequency\n", "      # ./spec/solution_spec.rb:9:in `block (2 levels) in <top (required)>'\n", "\n", "  16) Solution should respond to #print_highest_word_frequency_across_lines\n", "      Failure/Error: it { is_expected.to respond_to(:print_highest_word_frequency_across_lines) }\n", "        expected #<Solution:0x00000001897230> to respond to :print_highest_word_frequency_across_lines\n", "      # ./spec/solution_spec.rb:10:in `block (2 levels) in <top (required)>'\n", "\n", "  17) Solution#analyze_file creates 3 line analyzers\n", "      Failure/Error: expect(solution.analyzers.length).to eq 0\n", "\n", "      NoMethodError:\n", "        undefined method `analyzers' for #<Solution:0x000000018f9c78>\n", "      # ./spec/solution_spec.rb:14:in `block (3 levels) in <top (required)>'\n", "\n", "  18) Solution#calculate_line_with_highest_frequency calculates highest count across lines to be 4\n", "      Failure/Error: solution.analyze_file\n", "\n", "      NoMethodError:\n", "        undefined method `analyze_file' for #<Solution:0x000000018f2810>\n", "      # ./spec/solution_spec.rb:24:in `block (3 levels) in <top (required)>'\n", "\n", "  19) Solution#calculate_line_with_highest_frequency calculates highest count words across lines to be will, it, really\n", "      Failure/Error: solution.analyze_file\n", "\n", "      NoMethodError:\n", "        undefined method `analyze_file' for #<Solution:0x000000018e5d90>\n", "      # ./spec/solution_spec.rb:33:in `block (3 levels) in <top (required)>'\n", "\n", "Finished in 0.0301 seconds (files took 0.12308 seconds to load)\n", "19 examples, 19 failures\n", "\n", "Failed examples:\n", "\n", "rspec ./spec/line_analyzer_spec.rb:8 # LineAnalyzer has accessor for highest_wf_count\n", "rspec ./spec/line_analyzer_spec.rb:11 # LineAnalyzer has accessor for highest_wf_words\n", "rspec ./spec/line_analyzer_spec.rb:14 # LineAnalyzer has accessor for content\n", "rspec ./spec/line_analyzer_spec.rb:17 # LineAnalyzer has accessor for line_number\n", "rspec ./spec/line_analyzer_spec.rb:20 # LineAnalyzer has method calculate_word_frequency\n", "rspec ./spec/line_analyzer_spec.rb:35 # LineAnalyzer calls calculate_word_frequency when created\n", "rspec ./spec/line_analyzer_spec.rb:24 # LineAnalyzer attributes and values has attributes content and line_number\n", "rspec ./spec/line_analyzer_spec.rb:27 # LineAnalyzer attributes and values content attribute\n", "rspec ./spec/line_analyzer_spec.rb:30 # LineAnalyzer attributes and values line_number attribute\n", "rspec ./spec/line_analyzer_spec.rb:43 # LineAnalyzer#calculate_word_frequency highest_wf_count value is 3\n", "rspec ./spec/line_analyzer_spec.rb:46 # LineAnalyzer#calculate_word_frequency highest_wf_words check\n", "rspec ./spec/line_analyzer_spec.rb:49 # LineAnalyzer#calculate_word_frequency content attribute will have expected value\n", "rspec ./spec/line_analyzer_spec.rb:52 # LineAnalyzer#calculate_word_frequency line_number attribute\n", "rspec ./spec/solution_spec.rb:8 # Solution should respond to #analyze_file\n", "rspec ./spec/solution_spec.rb:9 # Solution should respond to #calculate_line_with_highest_frequency\n", "rspec ./spec/solution_spec.rb:10 # Solution should respond to #print_highest_word_frequency_across_lines\n", "rspec ./spec/solution_spec.rb:13 # Solution#analyze_file creates 3 line analyzers\n", "rspec ./spec/solution_spec.rb:23 # Solution#calculate_line_with_highest_frequency calculates highest count across lines to be 4\n", "rspec ./spec/solution_spec.rb:32 # Solution#calculate_line_with_highest_frequency calculates highest count words across lines to be will, it, really\n", "\n"][]
