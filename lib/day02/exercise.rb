module Day02
  submarine = {:horizontal_position => 0,:depth => 0, :aim => 0 } 

  File.foreach(ARGV[0]) do |line| 
    direction, count = line.split()
    case direction.to_sym
    when :down then submarine[:aim] += count.to_i
    when :up then submarine[:aim] -= count.to_i
    when :forward
      submarine[:horizontal_position] += count.to_i
      submarine[:depth] += submarine[:aim] * count.to_i
    end
  end

  puts "horizontal position of #{submarine[:horizontal_position]}, and a depth of #{submarine[:aim]}"
  puts "solution 1: #{submarine[:horizontal_position] * (submarine[:aim])}"

  puts "horizontal position of #{submarine[:horizontal_position]}, and a depth of #{submarine[:depth]}"
  puts "solution 2: #{submarine[:horizontal_position] * submarine[:depth]}"

end

