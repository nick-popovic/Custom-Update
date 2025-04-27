#!/bin/bash

# copy the welcome message to the bin directory
cp -f ./.update /usr/local/bin/.update

# ensure update script is executable
# copy the update script to the bin directory
chmod ugo+x /usr/local/bin/update
cp -f ./update /usr/local/bin/update
