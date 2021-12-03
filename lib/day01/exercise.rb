module Day01
  def sum_values(values)
    origins = values[0,values.size() -1]
    destinations = values[1,values.size()]
    origins.zip(destinations).count { |origin, destination| origin < destination }
  end


  lines = []
  File.foreach(ARGV[0]) { |line| lines << line.to_i }
  puts "First solution: #{sum_values(lines)}"

  first = lines[0, lines.size() -2]
  second = lines[1, lines.size() -1]
  thrid = lines[2, lines.size()]
  summarized_list = first.zip(second, thrid).map { |x,y,z| x + y + z }

  puts "Second solution: #{sum_values(summarized_list)}"
end
