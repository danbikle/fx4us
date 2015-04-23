#!/bin/bash

# /home/ann/fx4us/install_postgres.bash

# I should run this script as root

apt-get install postgresql

# Linux user ann should be able to connect to ann db as ann:
su -c "createdb   ann" postgres
su -c "createuser ann" postgres

exit
