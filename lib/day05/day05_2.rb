hv_values = []
diagonals = []
max_x = 0
max_y = 0
File.readlines(ARGV.first).each do |line|
  a, b, c, d = line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures
  x1 = a.to_i
  y1 = b.to_i
  x2 = c.to_i
  y2 = d.to_i
  if x1 == x2 || y1 == y2
    hv_values << [x1, y1, x2, y2]
  elsif 
    diagonals << [x1, y1, x2, y2]
  end

  if x1 > max_x
    max_x = x1
  end
  if x2 > max_x
    max_x = x2
  end
  if y1 > max_y
    max_y = y1
  end
  if y2 > max_y
    max_y = y2
  end
end

map = Array.new(max_y + 1) { Array.new(max_x + 1, 0 ) }

def max(a,b)
  a>b ? a : b
end

def min(a,b)
  a<b ? a : b
end

hv_values.each do |r|
  x1, y1, x2, y2 = r
  (min(x1,x2)..max(x1,x2)).each do |x|
    (min(y1,y2)..max(y1,y2)).each do |y|
      map[y][x] += 1
    end
  end
end

diagonals.each do |r|
  # TODO
  x1, y1, x2, y2 = r
end


counter = 0
map.each do |r|
  counter += r.select { |v| v >= 2 }.count
end

puts "Solution: #{map.map { |r| r.select { |v| v >= 2 }.count }.sum}"

