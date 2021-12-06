lanternfishes = Array.new(ARGV.first.split(',').map(&:to_i))
iterations = ARGV[1].to_i

def loop(n, iter)
  if iter < n 
    return 0
  elsif iter == n 
    return 1
  else 
    return 1 + loop(n, iter - 7) + loop(n, iter - 2 - 7 )
  end
end

#lanternfishes.each do |v|
  #puts "para valor #{v} y #{iterations} iteracciones : #{loop(v,iterations)}"
#end

lanternfishes.map! { |v| loop(v,iterations - 1) }
puts lanternfishes.sum + lanternfishes.length
