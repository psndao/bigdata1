#!/usr/bin/env python3
import sys

max_word = None
max_count = 0

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    try:
        key, value = line.split('\t')
        word, count = value.split(':')
        count = int(count)
        if count > max_count:
            max_count = count
            max_word = word
    except ValueError:
        continue

if max_word:
    print(f"{max_word}\t{max_count}")
