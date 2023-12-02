input_file = "input"

with open(input_file) as file:
    lines = file.readlines()

limits = {
    "red": 12,
    "green": 13,
    "blue": 14
}

valid_ids = []

for line in lines:
    line = line.strip().split(": ")
    id = int(line[0].replace("Game ", ""))
    colors = line[1].replace(";", ",").split(", ")

    valid = all(int(color.split(" ")[0]) <= limits[color.split(" ")[1]] for color in colors)

    if valid:
        valid_ids.append(id)

total_valid_sum = sum(valid_ids)

print(total_valid_sum)
