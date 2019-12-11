#!/usr/bin/env bash

cd ../..

curl https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.gz -o libunistring-0.9.10.tar.gz

tar xzf libunistring-0.9.10.tar.gz
mv libunistring-0.9.10 c++
rm libunistring-0.9.10.tar.gz

cd c++
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --disable-shared --enable-static
make

make install

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include

exit ${r1}
