#!/bin/bash
set -e

# setup deploy key for www-data user
cp /root/.ssh/id_rsa /var/www/.ssh/id_rsa
chmod 0700 /var/www/.ssh
chmod 0600 /var/www/.ssh/id_rsa
chown -R 33:33 /var/www/.ssh

if [ "$1" = 'python' ]; then
    exec gosu 33:33 "$@"
fi

exec "$@"
