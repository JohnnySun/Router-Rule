#!/bin/bash

# See https://github.com/bgptools/anycast-prefixes
# See https://bgp.tools/kb/anycatch

# 指定第一个URL
anycatch_v4_prefixes_url="https://raw.githubusercontent.com/bgptools/anycast-prefixes/master/anycatch-v4-prefixes.txt"

# 指定第二个URL
anycatch_v6_prefixes_url="https://raw.githubusercontent.com/bgptools/anycast-prefixes/master/anycatch-v6-prefixes.txt"

# 使用curl或wget下载第一个URL的内容，根据你的系统和个人喜好选择一种方式
# 使用curl
content1=$(curl -s "$anycatch_v4_prefixes_url")


# 使用wget
# content1=$(wget -qO- "$anycatch_v4_prefixes_url")


# 使用curl或wget下载第二个URL的内容，根据你的系统和个人喜好选择一种方式
# 使用curl
content2=$(curl -s "$anycatch_v6_prefixes_url")

# 使用wget
# content2=$(wget -qO- "$anycatch_v6_prefixes_url")

echo "payload:"

# 将第一个内容按行分割并处理
echo "$content1" | while IFS= read -r line1 || [[ -n "$line1" ]]; do
  # 在每一行的末尾添加"ip-cidr, "和", Anycast"
  modified_line="  - , $line1"
  echo "$modified_line"
done

# 将第二个内容按行分割并处理
echo "$content2" | while IFS= read -r line2 || [[ -n "$line2" ]]; do
  # 在每一行的末尾添加"ip6-cidr, "和", Anycast"
  modified_line="  - , $line2"
  echo "$modified_line"
done
