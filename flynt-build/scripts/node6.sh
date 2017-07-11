#! /bin/bash
# Install nvm with node and npm
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y -q --no-install-recommends nodejs
rm -rf /var/lib/apt/lists/*