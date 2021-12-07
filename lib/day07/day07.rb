values = []
File.readlines(ARGV.first).each { |line| values.append(line.strip.split(',').map(&:to_i)) }

values.flatten!

def median(array)
  sorted = array.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

def avg(array)
  (array.sum(0.0) / array.size).round
end

$memory = {}
def loop(n)
  if $memory.key?(n)
    return $memory[n]
  elsif n == 0
    return 0
  end

  $memory[n] = n + loop(n-1)
  $memory[n]
end


median = median(values)
avg = avg(values)
median_array = values.map { |v| (v - median).abs }
s_array = []
values.each do |x|
  v_array = values.map { |y| (x - y).abs }
  fuel = v_array.map { |n| loop(n) }.sum
  s_array << fuel
end

  

puts "Median: #{median}"
puts "Avg: #{avg}"
puts "Solution 1: #{median_array.sum}"
puts "Solution 2: #{s_array.min}"

# 92949057 is worng / too high
#


