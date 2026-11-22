#!/bin/sh
# 从 llm.yaml (Clash classical payload) 生成 Shadowrocket 用的 llm.list
# llm.yaml 是唯一的数据源，修改后运行 ./build.sh
cd "$(dirname "$0")" || exit 1
{
  echo "# Generated from llm.yaml by build.sh — do not edit"
  sed -n 's/^  - \(.*\)$/\1/p; s/^  \(#.*\)$/\1/p' llm.yaml
} > llm.list
