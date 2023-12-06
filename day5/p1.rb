lines = File.readlines("input.test")

seeds = lines[0].gsub("\n", "").gsub("seeds: ", "").split(" ")
puts "Seeds: #{seeds}"

