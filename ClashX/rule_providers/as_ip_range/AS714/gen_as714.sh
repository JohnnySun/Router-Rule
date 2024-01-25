#!/bin/bash

# See https://github.com/bgptools/anycast-prefixes
# See https://bgp.tools/kb/anycatch

# 指定第一个URL
v4_prefixes=$(curl -s https://api.ipapi.is\?q\=AS714 | jq --raw-output '.prefixes[]')

# 指定第二个URL
v6_prefixes=$(curl -s https://api.ipapi.is\?q\=AS714 | jq --raw-output '.prefixesIPv6[]')


echo "payload:"

# 将第一个内容按行分割并处理
echo "$v4_prefixes" | while IFS= read -r line1 || [ -n "$line1" ]; do
  # 在每一行的末尾添加"ip-cidr, "和", Anycast"
  modified_line="  - $line1"
  echo "$modified_line"
done

# 将第二个内容按行分割并处理
echo "$v6_prefixes" | while IFS= read -r line2 || [ -n "$line2" ]; do
  # 在每一行的末尾添加"ip6-cidr, "和", Anycast"
  modified_line="  - $line2"
  echo "$modified_line"
done
