def isdigit(i)
    return i =~ /[0-9]/
end

fileobject = File.open("input", "r")
lines = fileobject.readlines
fileobject.close()


answers = []
linesback = lines
linesback.size do |l|
    p l
    lines[l] = lines[l].reverse
end

firstDigit = nil
lastDigit = nil

lines.each do |l|
    l.gsub!("twone", "2ne")
    l.gsub!("oneight", "1ight")
    l.gsub!("threeight", "3ight")
    l.gsub!("fiveight", "5ight")
    l.gsub!("eightwo", "8wo")
    l.gsub!("eighthree", "8hree")
    l.gsub!("nineight", "9ight")
    l.gsub!("sevenine", "7ine")
    l.gsub!("one", "1")
    l.gsub!("two", "2")
    l.gsub!("three", "3")
    l.gsub!("four", "4")
    l.gsub!("five", "5")
    l.gsub!("six", "6")
    l.gsub!("seven", "7")
    l.gsub!("eight", "8")
    l.gsub!("nine", "9")
    l.each_char do |c|
        if isdigit(c)
            firstDigit = c 
            break
        end
    end
end
linesback.each do |l|
    l.gsub!("twone".reverse, "2ne".reverse)
    l.gsub!("oneight".reverse, "1ight".reverse)
    l.gsub!("threeight".reverse, "3ight".reverse)
    l.gsub!("fiveight".reverse, "5ight".reverse)
    l.gsub!("eightwo".reverse, "8wo".reverse)
    l.gsub!("eighthree".reverse, "8hree".reverse)
    l.gsub!("nineight".reverse, "9ight".reverse)
    l.gsub!("sevenine".reverse, "7ine".reverse)
    l.gsub!("one".reverse, "1".reverse)
    l.gsub!("two".reverse, "2".reverse)
    l.gsub!("three".reverse, "3".reverse)
    l.gsub!("four".reverse, "4".reverse)
    l.gsub!("five".reverse, "5".reverse)
    l.gsub!("six".reverse, "6".reverse)
    l.gsub!("seven".reverse, "7".reverse)
    l.gsub!("eight".reverse, "8".reverse)
    l.gsub!("nine".reverse, "9".reverse)
    l.each_char do |c|
        if isdigit(c)
            lastDigit = c 
            break
        end
    end
end
firstDigit << lastDigit
answers << firstDigit.to_i
sum = 0
answers.each do |c|
    sum += c
end
p sum
