#!/bin/sh

apt-get install -y bison ruby openssl libyaml
rm -rf /var/lib/apt/lists/*
mkdir -p /usr/src/ruby
curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" | tar -xjC /usr/src/ruby --strip-components=1
cd /usr/src/ruby
autoconf
./configure --disable-install-doc --enable-shared
make -j"$(nproc)"
apt-get purge -y --auto-remove bison ruby
make install
cd /
rm -rf /usr/src/ruby

# skip installing gem documentation
echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

gem install bundler
bundle config --global path "$GEM_HOME"
bundle config --global bin "$GEM_HOME/bin"
