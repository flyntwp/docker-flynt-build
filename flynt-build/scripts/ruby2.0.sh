#! /bin/bash
# Install Ruby
apt-get update
apt-get install -y -q --no-install-recommends python-software-properties \
  software-properties-common
add-apt-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y -q --no-install-recommends ruby2.0 \
  ruby2.0-dev \
  ruby-switch 
ruby-switch --set ruby2.0
gem install bundler
rm -rf /var/lib/apt/lists/*
