#!/bin/sh

apt-get -y install openssl
mkdir -p /usr/src/git
curl -SL "https://www.kernel.org/pub/software/scm/git/git-2.2.0.tar.xz" | tar -xJC /usr/src/git --strip-components=1
cd /usr/src/git

./configure --prefix=/usr --with-gitconfig=/etc/gitconfig
make -j"$(nproc)"
make install

cd /
rm -rf /usr/src/git

