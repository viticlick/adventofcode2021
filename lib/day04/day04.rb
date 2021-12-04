require 'set'

class Number
  attr_reader :value
  
  def initialize(value)
    @value = value
    @marked = false
  end

  def mark
    @marked = true
  end

  def marked?
    @marked
  end
end

class Board

  def initialize(matrix)
    @value_set =  Set.new
    @matrix = [] 
    matrix.each do |line| 
      @matrix << line 
      line.each { |value| @value_set << value }
    end
    matrix.transpose.each { |line| @matrix << line }
  end

  def has_winner_line?
    @matrix.any? do |line| 
      line.all? { |number| number.marked? }
    end
  end

  def unmarked_sum
    unmarked_numbers.map { |n| n.value }.sum
  end

  private

  def unmarked_numbers
    @value_set.select { |number| !number.marked? }
  end
    
end


$values = {}
def parse_numbers(input, splitter=' ')
  input.strip.split(splitter).map do |v|
    $values[v.to_sym] = Number.new(v.to_i) unless $values.key?(v.to_sym)
    $values[v.to_sym]
  end
end

def parse_file(filename)
  first_line = true
  drawn_numbers = []
  current_board = []
  boards = []
  File.readlines(ARGV.first).each do |line|
    if first_line
      drawn_numbers = parse_numbers(line,',')
      first_line = false
    elsif line.strip.empty?
      boards << Board.new(current_board) unless current_board.empty?
      current_board = []
    else
      current_board << parse_numbers(line)
    end
  end
  boards << Board.new(current_board)
  return boards, drawn_numbers
end

boards, drawn_numbers =  parse_file(ARGV.first)

first_solution_found = false
drawn_numbers.each do |number|
  number.mark
  boards.each do |board|
    if board.has_winner_line?
      unless first_solution_found
        puts "Winer line with number #{number.value}"
        puts "unmarked sum values: #{board.unmarked_sum}" 
        puts "Solution 1: #{number.value * board.unmarked_sum}" 
        first_solution_found = true
      end
      if boards.length > 1
        boards.delete(board)
      else
        puts "-Winer line with number #{number.value}"
        puts "-unmarked sum values: #{board.unmarked_sum}" 
        puts "Solution 2: #{number.value * board.unmarked_sum}" 
        boards.delete(board)
      end
    end
  end
end

