lines = File.open("input", "r") do |file|
    file.readlines
end

lines.count.times do |i|
    lines[i] = lines[i].gsub("one", "o1e")
    lines[i] = lines[i].gsub("two", "t2")
    lines[i] = lines[i].gsub("three", "t3e")
    lines[i] = lines[i].gsub("four", "4")
    lines[i] = lines[i].gsub("five", "5e")
    lines[i] = lines[i].gsub("six", "6")
    lines[i] = lines[i].gsub("seven", "7n")
    lines[i] = lines[i].gsub("eight", "e8t")
    lines[i] = lines[i].gsub("nine", "n9e")
    lines[i] = lines[i].gsub(/[^0-9]/, "")
    lines[i] = (lines[i][0]) + (lines[i][-1])
end

p lines.map(&:to_i).sum