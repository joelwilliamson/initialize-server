#!/bin/sh

# Install useful software utilities
apt-get install --assume-yes git

./mail.sh

apt-get install --assume-yes nginx
scp -r -P 223 joel@ssh.joelwilliamson.ca:server-files/etc/nginx /etc
mkdir /data
scp -r -P 223 joel@ssh.joelwilliamson.ca:Documents/jekyll-blog/_site /data
mv /data/_site/* /data
rm -r /data/_site

./swap.sh
./reddit-digest.sh
