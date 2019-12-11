#!/usr/bin/env bash

sed -i 's#/src/target/classes/win64/lib#/src/src/main/scripts/win64/libiconv/win64/lib#g' /src/src/main/scripts/win64/libiconv/win64/lib/libiconv.la

export $ LDFLAGS="-L/src/src/main/scripts/win64/libiconv/win64/lib" CFLAGS="-I/src/src/main/scripts/win64/libiconv/win64/include"

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
cp -r /usr/local/include /src/target/classes/win64/
cp -r /usr/local/lib /src/target/classes/win64/

exit ${r1}
