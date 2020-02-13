#!/bin/bash

# Log function
function LOG() {
  # Log date
  fmt_date=$(date +"%D %T")
  # Log msg
  msg="$fmt_date - $1"
  
  # Print & Log
  echo $msg
  echo $msg >> ./dynHost.log
}

###
# Script body
###

# Checking env variables
if [ -z $OVH_USERNAME ]; then
    LOG "OVH_USERNAME is not set."
    exit 1
elif [ -z $OVH_PASSWD ]; then
    LOG "OVH_PASSWD is not set."
    exit 1
elif [ -z $OVH_HOSTNAME ]; then
    LOG "OVH_HOSTNAME is not set."
    exit 1
fi

# Current ip address
ip=$(curl -s https://api.ipify.org)
# Stored ip address
str_ip=$EXTERNAL_IP

# Log stored and current ip
LOG "Current external IP address: $ip"
LOG "Stored external IP address: $str_ip"

if [ "$ip" = "$str_ip" ]; then
	LOG "IP haven't change."
else
	LOG "IP have change."

	# Updating dynHost IP
	url="https://www.ovh.com/nic/update?system=dyndns&hostname=$OVH_HOSTNAME&myip=$ip"
	LOG $(curl $url --user $OVH_USERNAME:$OVH_PASSWD)

	# Set the Stored ip address variable
	export EXTERNAL_IP=$ip

fi

# Log separator
LOG "-------------------------------------------------------"