#!/bin/sh

apt-get -y install libffi-dev
mkdir -p /usr/src/python
curl -SL "http://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz" | tar -xJC /usr/src/python --strip-components=1
cd /usr/src/python

./configure --prefix=/usr --enable-shared --with-system-expat --with-system-ffi --enable-unicode=ucs4
make -j"$(nproc)"
make install

cd /
rm -rf /usr/src/python

chmod -v 755 /usr/lib/libpython2.7.so.1.0
