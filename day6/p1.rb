def isWin(timeHold, raceId)
    time, winDist = $races[raceId].map{|x| x.to_i}
    distance = timeHold * (time - timeHold)
    return distance > winDist
end

lines = File.readlines("input")
$races = []
lines[0].gsub("\n", "").split(" ").each.with_index do |r, i|
    $races << [r, lines[1].gsub("\n", "").split(" ")[i]]
end
$races.delete_at(0)

sums = []

$races.each.with_index do |r, i|
    solutions = 0
    timeHold = 0
    r[0].to_i.times do |t|
        solutions += 1 if isWin(timeHold, i)
        timeHold += 1
    end
    sums << solutions
end


sum = 1
sums.each do |s|
    sum *= s
end

p sum