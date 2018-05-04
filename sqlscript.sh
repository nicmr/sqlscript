#!/bin/bash

delimiter=";"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OPTIND=1

function generateAlias{
if [ ! -f ~/.bash_aliases ]; then
  echo "alias sqlscript=$DIR/sqlscript.sh" > ~/.bash_aliases
else
  grep "sqlscript" ~/.bash_aliases
  if [! "$?" = "0"]; then
    echo "alias sqlscript=$DIR/sqlscript.sh" >> ~/.bash_aliases
  fi
fi
}

if [ ! -f  ~/.sqllogindata ]; then
  echo ">No login file found in home, creating a new one."
  echo ">WARNING:  use only in secure environments, data is stored in plain text"
  echo ">Please enter your username"
  read username
  echo ">Hi $username, nice to meet you."
  echo ">Please enter your password."
  read password
  echo "${username}${delimiter}${password}" >  ~/.sqllogindata
fi


#handle cl arguments
while getopts "a" opt; do
  case "$opt" in
  a) generateAlias 
     ;;
}

login="$(cat ~/.sqllogindata)"
IFS=\\$delimiter read -a loginarr  <<<"$login"
mysql -h 193.196.143.168 -u "${loginarr[0]}" -p"${loginarr[1]}"




