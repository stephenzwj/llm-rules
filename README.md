# llm-rules

LLM / AI 相关域名的统一路由规则，只含公开域名，不含任何节点或凭据。

- `custom.yaml`：手写规则（唯一需要手动编辑的文件）
- `sync.py`：合并 `custom.yaml` 与上游 AI 规则集（blackmatrix7 的 OpenAI/Claude/Gemini/Copilot、jinxinkai 的 xAI/Muse、MetaCubeX 的 openai 与 category-ai-!cn），去重后生成下面两个文件
- `llm.yaml`：Clash/OpenClash（Mihomo）`behavior: classical` rule-provider（生成）
- `llm.list`：Shadowrocket 等使用（生成）

更新：`./sync.py && git commit -am sync && git push`（需要 python3 和 curl）

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
