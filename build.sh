BIN=$HOME/.msvc/bin/x64
TESTS=$PWD
echo $TESTS
. ./msvcenv-native.sh
CC="clang --target=$TARGET_TRIPLE" CXX="clang++ --target=$TARGET_TRIPLE -Wno-everything" RC="llvm-rc" cmake -S"$TESTS" -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_MT="$(which llvm-mt)"
cmake --build build