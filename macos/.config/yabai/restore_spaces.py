#! /usr/bin/env python3

import sys
import subprocess
import json

def get_spaces():
    cmd = ("yabai", "-m", "query", "--spaces")
    completed = subprocess.run(
        cmd, stdout=subprocess.PIPE, encoding="utf-8", check=True
    )
    return json.loads(completed.stdout)


def create_spaces(spaces):
    remaining = len(spaces) - len(get_spaces())
    for _ in range(remaining):
        cmd = ("yabai", "-m", "space", "--create")
        subprocess.run(cmd, check=True)

def rename_spaces(spaces):
    existing = get_spaces()

    used_names = {space["label"] for space in existing if space.get("label")}
    unnamed = {space["index"] for space in existing if not space.get('label')}

    remaining = sorted(set(spaces) - used_names)
    for (index, label) in zip(unnamed, remaining):
        cmd = ("yabai", "-m", "space", str(index), "--label", label)
        subprocess.run(cmd, check=True)

def delete_spaces(spaces):
    to_destroy = [space["index"] for space in get_spaces() if not space["label"]]
    for idx in sorted(to_destroy, reverse=True):
        cmd = ("yabai", "-m", "space", "--destroy", str(idx))
        subprocess.run(cmd, check=True)


def main():
    spaces = sys.argv[1:]
    create_spaces(spaces)
    rename_spaces(spaces)
    delete_spaces(spaces)


if __name__ == "__main__":
    main()
