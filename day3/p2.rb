class Number
    attr_reader :x, :y

    def initialize(x, y)
        @x = x
        @y = y
    end

    def find_whole_number(line)
        start = x
        finish = x
        start -= 1 while line[start - 1] =~ /[0-9]/ && start > 0
        finish += 1 while line[finish + 1] =~ /[0-9]/ && finish < line.length - 1
        line[start..finish]
    end
end

class Gear
    attr_reader :coords

    def initialize(x, y)
        @coords = [x, y]
    end

    def find_nums(lines)
        x, y = coords
        rows = []
        nums = []
        rows << lines[y - 1][(x - 1)..(x + 1)] if y > 0
        rows << lines[y][(x - 1)..(x + 1)]
        rows << lines[y + 1][(x - 1)..(x + 1)] if y < lines.length - 1
        connections = []
        rows.each.with_index do |row, k|
            next unless row =~ /[0-9]/

            if row[1] =~ /[0-9]/ && row[3] =~ /[0-9]/ && !(row[2] =~ /[0-9]/)
                connections << [1, (k - 1)]
                connections << [3, (k - 1)]
            elsif row[1] =~ /[0-9]/ && row[2] =~ /[0-9]/ && !(row[3] =~ /[0-9]/)
                connections << [1, (k - 1)]
            else
                row.each_char.with_index do |char, i|
                    connections << [(i - 1), (k - 1)] if char =~ /[0-9]/ && (connections.empty? || connections[-1][0] != (i - 2))
                end
            end
        end
        if connections.size == 2
            connections.each do |connection|
                nx = x + connection[0]
                ny = y + connection[1]
                number = Number.new(nx, ny)
                nums << number.find_whole_number(lines[ny])
            end
            $sum += (nums[0].to_i * nums[1].to_i)
        end
    end
end

lines = File.open("input", "r") do |file|
    file.readlines
end

$sum = 0

lines.each.with_index do |v, k|
    v.each_char.with_index do |char, index|
        if char == "*"
            gear = Gear.new(index, k)
            gear.find_nums(lines)
        end
    end
end

puts $sum
