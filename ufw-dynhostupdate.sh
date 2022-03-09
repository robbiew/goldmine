#!/bin/bash

start=`date +"%Y-%m-%d %T"`

HOSTS_ALLOW=/home/bbs/bbs/scripts/data/gm_whitelist.dat
IPS_ALLOW=/home/bbs/goldmine/ufw-dynamic-hosts.allow

add_rule() {
  local proto=$1
  local port=$2
  local ip=$3
  local regex="${port}\/${proto}.*ALLOW.*IN.*${ip}"
  local rule=$(/usr/sbin/ufw status numbered | grep $regex)
  if [ -z "$rule" ]; then
      /usr/sbin/ufw allow proto ${proto} from ${ip} to any port ${port}
      echo "${start} rule does not exist. Added ${proto} from ${ip} to any ${port}"
  else
      echo "${start} rule already exists. nothing to do."
  fi
}

delete_rule() {
  local proto=$1
  local port=$2
  local ip=$3
  local regex="${port}\/${proto}.*ALLOW.*IN.*${ip}"
  local rule=$(/usr/sbin/ufw status numbered | grep $regex)
  if [ -n "$rule" ]; then
      /usr/sbin/ufw delete allow proto ${proto} from ${ip} to any port ${port}
      echo "${start} rule deleted ${proto} from ${ip} to any port ${port}"
  else
      echo "${start} rule does not exist. nothing to do."
  fi
}


sed '/^[[:space:]]*$/d' ${HOSTS_ALLOW} | sed '/^[[:space:]]*#/d' | while read line
do
    proto=$(echo ${line} | cut -d: -f1)
    port=$(echo ${line} | cut -d: -f2)
    host=$(echo ${line} | cut -d: -f3)

    if [ -f ${IPS_ALLOW} ]; then
      old_ip=$(cat ${IPS_ALLOW} | grep ${host} | cut -d: -f2)
    fi

    ip=$(dig +short $host | tail -n 1)

    if [ -z ${ip} ]; then
        if [ -n "${old_ip}" ]; then
            delete_rule $proto $port $old_ip
           # echo "${start} ${proto} ${port} ${old_ip} removed"
        fi
        echo "${start} Failed to resolve the ip address of ${host}." 1>&2
        exit 1
    fi

    if [ -n "${old_ip}" ]; then
        if [ ${ip} != ${old_ip} ]; then
            delete_rule $proto $port $old_ip
        fi
    fi
    add_rule $proto $port $ip
    if [ -f ${IPS_ALLOW} ]; then
      sed -i.bak /^${host}*/d ${IPS_ALLOW}
    fi
    echo "${host}:${ip}" >> ${IPS_ALLOW}
done
