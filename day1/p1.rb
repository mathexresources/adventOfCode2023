def isdigit(i)
    return i =~ /[0-9]/
end

fileobject = File.open("input", "r")
lines = fileobject.readlines
fileobject.close()
answers = []
lines.each do |l|
    firstDigit = nil
    lastDigit = nil
    l.each_char do |c|
        if isdigit(c)
            firstDigit = c 
            break
        end
    end

    l.reverse.each_char do |c|
        if isdigit(c)
            lastDigit = c 
            break
        end
    end
    firstDigit << lastDigit
    answers << firstDigit.to_i
end
sum = 0
answers.each do |c|
    sum += c
end
p sum
