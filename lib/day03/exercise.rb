matrix = []
File.foreach(ARGV.first) { |line| matrix << line.strip.chars.map(&:to_i) }
ammount_columns = matrix.transpose.map(&:sum)
cut_value = matrix.length / 2


gamma_array = ammount_columns.map { |x| x > cut_value ? 1 : 0 } 
gamma = gamma_array.join.to_i(2)

epsilon_array = ammount_columns.map { |x| x > cut_value ? 0 : 1 } 
epsilon = epsilon_array.join.to_i(2)

oxygen_generator_bit_criteria  = ammount_columns.first >= cut_value ? 1 : 0
co2_scrubber_bit_criteria = ammount_columns.first >= cut_value ? 0 : 1

puts matrix.select { |line| line.first == oxygen_generator_bit_criteria }

puts "gamma arrary #{gamma_array}"
puts "oxygen bit: #{oxygen_generator_bit_criteria}"
puts "co2 bit: #{co2_scrubber_bit_criteria}"

puts "gamma: #{gamma} , epsilon: #{epsilon}"

puts "-"*30
puts "solution 1: #{ gamma * epsilon }"
