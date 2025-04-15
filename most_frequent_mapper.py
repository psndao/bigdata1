#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    try:
        word, count = line.split('\t')
        print(f"most\t{word}:{count}")
    except ValueError:
        continue  # skip bad lines
