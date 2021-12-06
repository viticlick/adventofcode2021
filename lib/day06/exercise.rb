lanternfishes = Array.new(ARGV.first.split(',').map(&:to_i))
iteractions = ARGV[1].to_i

#puts lanternfishes
#puts iteractions

iteractions.times do |_|
  new_lanternfishes = []
  additions = 0
  lanternfishes.each do |v|
    if v == 0
      new_lanternfishes << 6
      additions += 1
    else
      new_lanternfishes << v - 1
    end
  end
  additions.times { |_| new_lanternfishes << 8 }
  lanternfishes = new_lanternfishes
end

puts lanternfishes.length
