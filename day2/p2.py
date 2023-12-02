input_file = "input"

with open(input_file) as file:
    lines = file.readlines()

lines = [line.strip() for line in lines]

sum = 0

for line in lines:
    least = {"red": 0, "green": 0, "blue": 0}
    line = line.split(": ")[1].replace(";", ",").split(", ")
    
    for color in line:
        amount, color = map(str.split, color.split(" "))
        amount = int(amount[0])
        color = color[0]
        
        if amount > least[color]:
            least[color] = amount
    
    sum += least["red"] * least["green"] * least["blue"]

print(sum)
