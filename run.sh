#!/usr/bin/env bash

DAYS=3

echo "Advent of Code 2021 (https://adventofcode.com/2021)"
echo "by Geoff Blair (https://www.geoffblair.com)"

for ((DAY = 1; DAY <= DAYS; DAY++)); do
	lua src/day${DAY}.lua input/day${DAY}.txt
done
