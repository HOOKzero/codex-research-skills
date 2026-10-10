# 项目级 AGENTS.md 模板（请复制后按实际项目填写）

这是**参考模板**，不是可直接使用的全局规则。根据项目事实填完后才放在研究项目的 `AGENTS.md` 中；不应把它放进 Skill 源仓库根目录并视为通用规则。

```markdown
# Project Rules

## Research objective
- Current research question: <specific question>
- Primary evaluation protocol: <metric, split, aggregation>

## Protected paths
- Do not modify: <vendor source / frozen baseline / final checkpoints>
- If modification is needed, stop and obtain explicit permission.

## Data and checkpoints
- Dataset root: <local server path>
- Dataset/split version: <manifest path>
- Authorized pretrained checkpoint: <path/hash>
- Output/manifest directory: <experiment root>
- Never send patient-level/private data externally without authorization.

## Environment / compute
- Python/conda environment: <name/path>
- Training entry point: <command>
- Evaluation/independent verifier: <command>
- GPU budget and when approval is needed: <rule>

## Scientific acceptance
- Baseline ID and locked results: <path>
- Allowed metric calculation and absent-class policy: <definition>
- Expected reproducibility evidence: <run manifest/logs/config/seed>
```

这里才应写入 OLT-SAM 等具体项目里的 `sam3/` 不可修改约束、SAM 官方预训练权重路径、数据集划分等事实。不要把项目变量写到通用 `research-coding/SKILL.md`。
