# sqlscript

A simple shell script I made for me and my fellow students to facilitate logging into our university's mysql database with the linux bash.

## How to use:
When you run the script the first time, it will ask you for your login data and store it for future use. Having completed that process, logging into mysql will be as easy as calling the script.  
Hint: the password is currently only encrypted with base64, please don't use this script for databases that contain sensitive data.

## ToDo:
  * add the script to bash_aliases for easy access (done!)
  * allow change and deletion of stored login data
  * allow the user to enter the ip of the sql database themself (as of now, it's set to the IP of our university's db)
  * maybe: encryption (on dev branch, base64)
  

