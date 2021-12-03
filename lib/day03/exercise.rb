class BinaryDiagnostic

  def initialize(file)
    @matrix = []
    File.foreach(ARGV.first) { |line| @matrix << line.strip.chars.map(&:to_i) }
  end

  def gamma
    simple_calculator { |sum_bit, discriminator| sum_bit > discriminator ? 1 : 0 }
  end

  def epsilon
    simple_calculator { |sum_bit, discriminator| sum_bit > discriminator ? 0 : 1 }
  end

  def oxygen_generator
    generator { |bit_sum, discriminator| bit_sum >= discriminator ? 1 : 0 }
  end

  def co2_generator
    generator { |bit_sum, discriminator| bit_sum < discriminator ? 1 : 0 }
  end

  private

  def simple_calculator
    discriminator = @matrix.length / 2.0
    array = sum_bits(@matrix).map  { |x| yield(x, discriminator) }
    array.join.to_i(2)
  end

  def generator
    matrix = Array.new(@matrix)
    column = 0 
    while matrix.length > 1
      discriminator = matrix.length / 2.0
      bit_sum = sum_column(matrix,column)
      bit_criteria = yield(bit_sum, discriminator)
      matrix = filter_by_column(matrix, column, bit_criteria)
      column += 1
    end
    matrix.first.join.to_i(2)
  end

  def sum_bits(matrix)
    matrix.transpose.map(&:sum)
  end


  def sum_column(matrix, column)
    matrix.inject(0) { |sum, row| sum + row[column] }
  end

  def filter_by_column(matrix, column, bit)
    matrix.select { |line| line[column] == bit }
  end

end

binary_diagnostic = BinaryDiagnostic.new(ARGV.first)

puts "gamma: #{binary_diagnostic.gamma} , epsilon: #{binary_diagnostic.epsilon}"
puts "solution 1: #{ binary_diagnostic.gamma * binary_diagnostic.epsilon }"

puts "-"*30

oxygen = binary_diagnostic.oxygen_generator
co2 = binary_diagnostic.co2_generator

puts "oxygen: #{oxygen}, co2: #{co2}"
puts "solution 2: #{oxygen * co2}"
