#!/bin/bash

# use curl get CLOUDFRONT ip range
content=$(curl -sSL https://ip-ranges.amazonaws.com/ip-ranges.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.service == "CLOUDFRONT") | .ip_prefix,.ipv6_prefix' | grep "/")

echo "payload:"

# 将第一个内容按行分割并处理
echo "$content" | while IFS= read -r line1 || [ -n "$line1" ]; do
  # 在每一行的末尾添加"ip-cidr, "和", Anycast"
  modified_line="  - $line1"
  echo "$modified_line"
done
