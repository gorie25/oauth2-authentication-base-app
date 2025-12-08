import os
import subprocess
import sys

def run(cmd):
    result = subprocess.run(cmd, shell=True)
    if result.returncode != 0:
        sys.exit(result.returncode)

if __name__ == "__main__":
    if not os.path.exists("pubspec.yaml"):
        sys.exit(1)

    run("dart run build_runner build --delete-conflicting-outputs")
