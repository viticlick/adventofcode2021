lanternfishes = Array.new(ARGV.first.split(',').map(&:to_i))
iterations = ARGV[1].to_i

$memory = {}

def loop(n, iter)

  puts "evaluating #{n}_#{iter}"
  if $memory.key?("#{n}_#{iter}")
    puts "using memory for #{n}_#{iter}"
    return $memory["#{n}_#{iter}"]
  end

  result = 0
  if iter < n 
    result = 0
  elsif iter == n 
    result = 1
  else 
    result = 1 + loop(n, iter - 7) + loop(n, iter - 2 - 7 )
  end
  $memory["#{n}_#{iter}"] = result 
  result
end

lanternfishes.map! { |v| loop(v,iterations - 1) }
puts lanternfishes.sum + lanternfishes.length
