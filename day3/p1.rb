$sum = 0

class Number
    def initialize(me, x, y, length, lines)
        @me, @coords, @length, @lines = me, [x, y], length, lines
    end

    def find_chars
        rows = []
        x, y = @coords
        row_start = [x - 1, 0].max
        row_end = [x + @length + 1, @lines[y].length].min
        rows << @lines[y - 1][row_start...row_end] if y > 0
        rows << @lines[y][row_start...row_end]
        rows << @lines[y + 1][row_start...row_end] if y < @lines.length - 1

        rows.map! { |row| row.gsub(/[\n#{@me}.]/, '') }
        result = rows.join

        $sum += @me.to_i if result != ''
    end
end

lines = File.readlines("input")

lastX = 0
lastY = 0

lines.each.with_index do |v, k|
    v.each_char.with_index do |char, index|
        next if k == lastY && index < lastX
        if char =~ /\d/
            length = 1
            length += 1 while v[index + length] =~ /\d/
            number = Number.new(v[index...(index + length)], index, k, length, lines)
            number.find_chars
            lastX = index + length
            lastY = k
        end
    end
end

p $sum
