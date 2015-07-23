#!/bin/sh

apt-get install --assume-yes build-essential haskell-platform

# Cabal update uses huge amounts of RAM. Make a swapfile.
./swap
cabal update
# The cabal-install in LTS haskell-platform doesn't support sandboxes
cabal install cabal-install
cp /root/.cabal/bin/cabal /usr/local/bin


apt-get install --assume-yes sqlite3 libsqlite3-dev libdouble-conversion{1,-dev}
cd /home/joel
sudo -u joel git clone 'https://github.com/joelwilliamson/reddit-digest.git'
cd reddit-digest
sudo -u joel cabal sandbox init
sudo -u joel cabal install
sudo -u joel dist/dist-sandbox-*/build/reddit-digest/reddit-digest &
disown
