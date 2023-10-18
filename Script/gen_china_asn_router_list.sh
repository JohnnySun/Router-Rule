#!/bin/bash

# See https://github.com/bgptools/anycast-prefixes
# See https://bgp.tools/kb/anycatch

# 指定第一个URL
china_asn_prefixes_url="https://raw.githubusercontent.com/VirgilClyne/GetSomeFries/auto-update/ruleset/ASN.China.list"

content=$(curl -s "$china_asn_prefixes_url")

# 将第一个内容按行分割并处理
echo "$content" | while IFS= read -r line1; do
  # 在每一行的末尾添加"ip-cidr, "和", Anycast"
  modified_line="$line1, direct"
  echo "$modified_line"
done
