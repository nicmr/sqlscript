#!/bin/bash
delimiter=";"
if [ ! -f  ~/.sqllogin]; then
  echo "No login file found in home, creating a new one."
  echo "WARNING:  use only in secure environments, data is stored in plain text"
  echo "Please enter your username"
  read username
  echo "Hi $username, nice to meet you."
  echo "Please enter your password."
  read pw
  echo "${username}${delimiter}${password}" >  ~/.sqllogindata
fi

login="$(cat ~/.sqlllogindata)"
IFS=\\$delimiter read -a loginarr  <<<"$login"
mysql -h 193.196.143.168 -u "$loginarr[0]" -p"$loginarr[1]"
