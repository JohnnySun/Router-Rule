#!/bin/bash

url=" https://raw.githubusercontent.com/dler-io/Rules/main/Clash/Provider/Reject.yaml"

payload=$(curl -s "$url")

echo "payload:" > $1/ad_block_domain.yaml
printf $payload | grep DOMAIN-SUFFIX >> $1/ad_block_domain.yaml

echo "payload:" > $1/ad_block_ipcidr.yaml
printf $payload | grep IP-CIDR > $1/ad_block_ipcidr.yaml
