#!/bin/bash

# This runs as root on the server

# Are we on a vanilla system?
if ! hash chef-solo 2>/dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    aptitude update &&
    apt-get -o Dpkg::Options::="--force-confnew" \
        --force-yes -fuy dist-upgrade &&
    # install Ruby and Chef
    aptitude install -y ruby1.9.3 ruby1.9.3-dev make &&
    sudo gem install --no-rdoc --no-ri chef --version 11.2.0 
fi

