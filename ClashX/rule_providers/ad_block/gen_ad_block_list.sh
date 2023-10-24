#!/bin/bash

payload=`curl -L https://raw.githubusercontent.com/dler-io/Rules/main/Clash/Provider/Reject.yaml`

echo "payload:" > $1/ad_block_domain.yaml
echo $payload | grep DOMAIN-SUFFIX >> $1/ad_block_domain.yaml

echo "payload:" > $1/ad_block_ipcidr.yaml
echo $payload | grep IP-CIDR > $1/ad_block_ipcidr.yaml
