#! /usr/bin/env python3

import subprocess
import json

DISPLAYS = {
    # home setup
    "37D8832A-2D66-02CA-B9F7-8F30A301B230": "mac",
    "27407BA4-FA8A-4814-91B9-3847E04F3C2F": "right",
    "D04A9B33-5AF1-4ECC-9F78-716E74706F58": "left",
}


def get_displays():
    cmd = ("yabai", "-m", "query", "--displays")
    completed = subprocess.run(
        cmd, stdout=subprocess.PIPE, encoding="utf-8", check=True
    )
    return json.loads(completed.stdout)


def get_display_index(displays, selector):
    for display in displays:
        (uuid, index) = (display["uuid"], display["index"])
        if DISPLAYS.get(uuid) == selector:
            return index 

def move_to_display(space, index):
    cmd = ("yabai", "-m", "space", space, "--display", str(index))
    subprocess.run(cmd, check=False)


def main():
    displays = get_displays()

    left_spaces = ("org", "code", "terminal", "misc")
    right_spaces = ("web", "calendar", "mail", "chat")

    mac_index = get_display_index(displays, "mac")
    left_index = get_display_index(displays, "left")
    right_index = get_display_index(displays, "right")

    if left_index is not None and right_index is not None:
        if mac_index is not None:
            for space in ("misc",):
                move_to_display(space, mac_index)
            for space in ("org", "code", "terminal"):
                move_to_display(space, left_index)
        else:
            for space in left_spaces:
                move_to_display(space, left_index)
        for space in right_spaces:
            move_to_display(space, right_index)
    else:
        for space in left_spaces + right_spaces:
            move_to_display(space, mac_index)


if __name__ == "__main__":
    main()
