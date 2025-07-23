import sys
import json

def main():
    with open(sys.argv[1]) as f:
        filenames = json.load(f)
    with open(sys.argv[2]) as f:
        counts = json.load(f)

    with open("word_counts.tsv", "w") as f:
        for name, count in zip(filenames, counts):
            f.write(f"{name}\t{count}\n")

if __name__ == "__main__":
    main()
