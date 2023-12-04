h = Hash.new
$d = Hash.new

class Card
    attr_accessor :id, :win, :my
    def initialize(string)
        @id = string.split(": ")[0].gsub!("Card ", "").to_i
        string = $lines[@id - 1].split(": ")[1].split(" | ")
        @my = string[1].split(" ").map(&:to_i)
        @win = string[0].split(" ").map(&:to_i)
        matches = 0
        @my.each do |c|
            matches += 1 if @win.include?(c)
        end
        if matches > 0
            matches.times do |i|
                next_id = @id + i
                break unless $d[next_id.to_s].nil?
                $d[next_id.to_s] = Card.new($lines[next_id - 1])
            end
        end
    end
end


$lines = File.readlines("input")

$lines.each do |c|
    h[c.split(": ")[0].gsub!("Card ", "")] = Card.new(c)
end
puts (h.size) + ($d.size)