#!/bin/sh

# Install the mail server and spam filter.
# postfix needs manual intervention
apt-get install postfix spamassassin spamc --assume-yes
# Specify empty GECOS to disable prompting
adduser --disabled-login --gecos "" spamd

scp -r -P 223 joel@ssh.joelwilliamson.ca:server-files/etc/postfix /etc/
scp -r -P 223 joel@ssh.joelwilliamson.ca:server-files/etc/spamassassin /etc/
scp -P 223 joel@ssh.joelwilliamson.ca:server-files/etc/default/spamassassin /etc/default
