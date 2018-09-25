#! /bin/bash
# Install php
apt-get update
apt-get install -y -q --no-install-recommends python-software-properties \
  software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y -q --no-install-recommends php7.2 \
  php7.2-curl \
  php7.2-xml
rm -rf /var/lib/apt/lists/*
