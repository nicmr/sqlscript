#!/bin/bash

delimiter=";"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OPTIND=1

function generateAlias {
  if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
    echo "alias sqlscript=$DIR/sqlscript.sh" > ~/.bash_aliases
  else
    grep "sqlscript" ~/.bash_aliases
    if [ ! "$?" = "0" ]; then
      echo "alias sqlscript=$DIR/sqlscript.sh" >> ~/.bash_aliases
    else
      echo "alias already exists"
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
  read -s password
  echo -n "${username}${delimiter}${password}" | base64 >  ~/.sqllogindata
fi


#handle cl arguments
while getopts "a" opt; do
  case "$opt" in
  a) generateAlias 
     ;;
  esac
done

loginencrypt="$(cat ~/.sqllogindata)"
login=$(echo -n $login | base64 -d)
IFS=\\$delimiter read -a loginarr  <<<"$login"
mysql -h 193.196.143.168 -u "${loginarr[0]}" -p"${loginarr[1]}"
