#!/bin/python3

import sys, subprocess,zenipy

arg = sys.argv[1];
mode = arg;

if arg == 'fb':
    mode=zenipy.zenipy.entry(text='Enter Environment', placeholder='', title='', width=330, height=120, timeout=None)

if arg in ['int','local','fb','sandbox']:
    process = [
        "newman",
        "run",
        "/home/dev/streamdeck/EmptyCollection.json",
        "--export-environment",
        "/home/dev/streamdeck/envi.json",
        "--env-var",
        "environment="+mode
    ]

    subprocess.run(process)
else:
    print("something else" + arg);
