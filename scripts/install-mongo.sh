#!/bin/bash

set -e

if [ -f $APP_SOURCE_DIR/launchpad.conf ]; then
  source <(grep INSTALL_MONGO $APP_SOURCE_DIR/launchpad.conf)
fi

if [ "$INSTALL_MONGO" = true ]; then
  apt install -y wget
  
  printf "\n[-] Installing MongoDB ${MONGO_VERSION}...\n\n"

  wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add -

  echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list


#  apt-get install gnupg

	# apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 0C49F3730359A14518585931BC711F9BA15703C6

 #  echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/$MONGO_MAJOR main" > /etc/apt/sources.list.d/mongodb-org.list

 apt update

 apt install -y mongodb-org
   # apt-get install -y \
   #   ${MONGO_PACKAGE}=$MONGO_VERSION \
   #   ${MONGO_PACKAGE}-server=$MONGO_VERSION \
   #   ${MONGO_PACKAGE}-shell=$MONGO_VERSION \
   #   ${MONGO_PACKAGE}-mongos=$MONGO_VERSION \
   #   ${MONGO_PACKAGE}-tools=$MONGO_VERSION

   mkdir -p /data/{db,configdb}
   chown -R mongodb:mongodb /data/{db,configdb}

	 rm -rf /var/lib/apt/lists/*
	 rm -rf /var/lib/mongodb
   mv /etc/mongod.conf /etc/mongod.conf.orig

fi
