def part_1(content):
    range_lines, id_lines = content.split("\n\n")
    ranges = []
    fresh = 0

    for line in range_lines.splitlines():
        start, stop = line.split("-")
        ranges.append([int(start), int(stop)])

    for line in id_lines.splitlines():
        num = int(line)
        for range in ranges:
            if num >= range[0] and num <= range[1]:
                fresh += 1
                break

    return fresh

path = "input.txt"
with open(path, "r") as file:
    content = file.read().strip()

print(part_1(content))
