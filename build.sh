#!/bin/bash

set -e
mkdir -p ./build
cd build

cmake ..
cmake --build . #cross platform
echo "Build finished!"

cd ..

if [ -f "./build/GitHubActions" ]; then
	./build/GitHubActions
elif [ -f "./build/Debug/GitHubActions.exe" ]; then
	./build/Debug/GitHubActions.exe
else
	echo "Executable not found. Try updating the 'build.sh' script by adding more places to look for the executable."
	find build -name "GitHubActions*" -type -f
fi
