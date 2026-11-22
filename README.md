# llm-rules

LLM / AI 相关域名的统一路由规则，只含公开域名，不含任何节点或凭据。

- `llm.yaml`：数据源，Clash/OpenClash（Mihomo）`behavior: classical` rule-provider
- `llm.list`：由 `./build.sh` 生成，给 Shadowrocket 等使用

## Clash / OpenClash

```yaml
rule-providers:
  llm:
    type: http
    behavior: classical
    format: yaml
    url: "https://raw.githubusercontent.com/stephenzwj/llm-rules/main/llm.yaml"
    path: ./ruleset/llm.yaml
    interval: 3600
rules:
  - RULE-SET,llm,Proxies
```

## Shadowrocket

配置 → 规则 → 添加规则 → 类型 `RULESET`，URL 填
`https://raw.githubusercontent.com/stephenzwj/llm-rules/main/llm.list`，策略选 `PROXY`。
