#! /bin/bash
# Install php
apt-get install -y -q --no-install-recommends python-software-properties \
  software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y -q --no-install-recommends php7.0 \
  php7.0-curl \
  php7.0-xml
rm -rf /var/lib/apt/lists/*
