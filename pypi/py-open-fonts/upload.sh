#!/bin/bash
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

python setup.py sdist
if [[ "$(uname -s)" == MINGW* ]]; then
    winpty twine upload dist/* --skip-existing
else
    twine upload dist/* --skip-existing; fi

rm -rf ./dist
