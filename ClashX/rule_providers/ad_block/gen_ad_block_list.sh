#!/bin/bash

url="https://raw.githubusercontent.com/dler-io/Rules/main/Clash/Provider/Reject.yaml"

payload=$(curl -s $url)

echo "payload:" > $1/ad_block_domain.yaml
printf "$payload" | grep DOMAIN >> $1/ad_block_domain.yaml
# parse to +.domain.com
sed -i "s/- DOMAIN\(.*\),\(.*\)/- '+.\2'/g" "$1/ad_block_domain.yaml"
sed -i "s/- DOMAIN-SUFFIX,/./g" "$1/ad_block_domain.txt"
sed -i "s/- DOMAIN,//g" "$1/ad_block_domain.txt"
sed '/^ \+/d' "$1/ad_block_domain.txt"

echo "payload:" > $1/ad_block_ipcidr.yaml
printf "$payload" | grep IP-CIDR | sed 's/IP-CIDR.*,//g'>> $1/ad_block_ipcidr.yaml
