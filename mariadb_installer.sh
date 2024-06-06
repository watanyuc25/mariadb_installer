#!/bin/bash
#install mariadb version 11.4
#get key and repo.
echo "Create repo"
apt install apt-transport-https curl
mkdir -p /etc/apt/keyrings
curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

#create repo.
cat > /etc/apt/sources.list.d/mariadb.sources << EOF
# MariaDB 11.4 repository list - created 2024-06-06 16:58 UTC
# https://mariadb.org/download/
X-Repolib-Name: MariaDB
Types: deb
# deb.mariadb.org is a dynamic mirror if your preferred mirror goes offline. See https://mariadb.org/mirrorbits/ for details.
# URIs: https://deb.mariadb.org/11.4/ubuntu
URIs: https://mirror.kku.ac.th/mariadb/repo/11.4/ubuntu
Suites: jammy
Components: main main/debug
Signed-By: /etc/apt/keyrings/mariadb-keyring.pgp
EOF

echo "install mariadb"
#install mariadb
apt update
apt -y install mariadb-server mariadb-client mariadb-backup

echo "run command \"mysql_secure_installation\"

