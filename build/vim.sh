#!/bin/sh

mkdir -p /usr/src/vim
curl -SL "ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2" | tar -xjC /usr/src/vim --strip-components=1
cd /usr/src/vim

echo '#define SYS_VIMRC_FILE  "/etc/vimrc"' >>  src/feature.h
echo '#define SYS_GVIMRC_FILE "/etc/gvimrc"' >> src/feature.h

./configure --prefix=/usr --with-features=huge --enable-gui=no --without-x --enable-rubyinterp --enable-pythoninterp
make -j"$(nproc)"
make install

cd /
rm -rf /usr/src/vim
