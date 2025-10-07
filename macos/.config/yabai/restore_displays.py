#! /usr/bin/env python3

import subprocess
import json

DISPLAYS = {
    # home setup
    "28B260CC-7929-4455-A14F-8FE705CB73A7": ("org", "code", "terminal", "misc"),
    "C9C3FD01-BC24-4C6E-9F74-B32E4AFDCC9D": ("web", "calendar", "mail", "chat"),
}


def get_displays():
    cmd = ("yabai", "-m", "query", "--displays")
    completed = subprocess.run(
        cmd, stdout=subprocess.PIPE, encoding="utf-8", check=True
    )
    return json.loads(completed.stdout)

def get_spaces():
    cmd = ("yabai", "-m", "query", "--spaces")
    completed = subprocess.run(
        cmd, stdout=subprocess.PIPE, encoding="utf-8", check=True
    )
    return json.loads(completed.stdout)


def move_to_display(space, index):
    cmd = ("yabai", "-m", "space", space, "--display", str(index))
    subprocess.run(cmd, check=False)


def main():
    displays = get_displays()
    uuid_by_idx = {d["index"]: d["uuid"] for d in displays}
    uuid_by_space_label = {s["label"]: uuid_by_idx[s["display"]] for s in get_spaces()}

    for (index, uuid) in uuid_by_idx.items():
        for space in DISPLAYS.get(uuid, ()):
            print(space, uuid_by_space_label[space], uuid)
            if uuid_by_space_label[space] != uuid:
                move_to_display(space, index)

if __name__ == "__main__":
    main()
