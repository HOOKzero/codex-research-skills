# Research sources and attribution

检索时间：2026-10-10。本文记录**设计思路来源**，非第三方文件拷贝或保证。实际引用/再分发第三方 Skill 前，请检查仓库和单项内容许可证（有些仓库整体软件与 Skill 内容许可不同）。

| 参考来源 | 查看原始 `SKILL.md` | 借鉴（重新归纳） | 适用组件 |
| --- | --- | --- | --- |
| OpenAI `skill-creator` | https://github.com/openai/skills/blob/main/skills/.system/skill-creator/SKILL.md | Concise is Key、渐进加载、按需 references | 全部 |
| Context optimization | https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering/blob/main/skills/context-optimization/SKILL.md | 缩减工具输出、只取高信号上下文、会话分区/压缩思想 | token-efficient-coding |
| K-Dense Experimental Design | https://github.com/K-Dense-AI/scientific-agent-skills/blob/main/skills/experimental-design/SKILL.md | 随机性、对照、独立重复、混杂因素 | research-coding |
| K-Dense GPU Optimization | https://github.com/K-Dense-AI/scientific-agent-skills/blob/main/skills/optimize-for-gpu/SKILL.md | 性能优化前 profiling、保留数值契约 | research-coding 参考 |
| K-Dense Scientific Critical Thinking | https://github.com/K-Dense-AI/scientific-agent-skills/blob/main/skills/scientific-critical-thinking/SKILL.md | 证据与结论范围、混杂与统计有效性 | research-coding |
| RSE Reproducibility | https://github.com/fdiblen/rseng-agent-skills/blob/main/skills/rseng-reproducibility/SKILL.md | 代码/数据/环境可复现、随机种子与一键复现思路 | research-coding |
| RSE Provenance | https://github.com/fdiblen/rseng-agent-skills/blob/main/skills/rseng-provenance/SKILL.md | run 级 provenance、artifact 相邻 manifest | research-coding |
| ML Training Recipes | https://github.com/Orchestra-Research/AI-Research-SKILLs/blob/main/10-optimization/ml-training-recipes/SKILL.md | 深度学习数值诊断、GPU 资源、分层验证 | research-coding |
| Evidence-Grounded ML Planner | https://github.com/HopperHou/evidence-grounded-ml-experiment-planner/blob/main/SKILL.md | 区分 observation/hypothesis/evidence/claim，限制昂贵实验 | research-coding |
| Reproducing Papers | https://github.com/LYHrmer/reproducing-papers-skill/blob/main/SKILL.md | 精确提取论文机制、定位具体 call site/不变量 | paper-reproduction |
| Paper Reproduction Workflow | https://github.com/Yang-goat/research-reproduction-skills/blob/main/paper-reproduction-workflow/SKILL.md | 提取→冻结协议→执行→验证→独立审计的关口 | paper-reproduction |
| Experiment Verifier | https://github.com/Yang-goat/research-reproduction-skills/blob/main/experiment-verifier/SKILL.md | 原始结果独立指标复核，与科研结论解耦 | paper-reproduction |
| Reproduction Auditor | https://github.com/Yang-goat/research-reproduction-skills/blob/main/reproduction-auditor/SKILL.md | 审计独立性、范围限定、不可用 PASS 代替 scientific validity | paper-reproduction |
| Paper2Code | https://github.com/SCUTxyx/paper2code/blob/main/SKILL.md | 公式到代码映射、性质/梯度测试、诚实差距清单 | paper-reproduction |
| Codex academic suite | https://github.com/Imbad0202/academic-research-skills-codex/blob/main/skills/academic-research-suite/SKILL.md | 单入口路由、大量子工作流按需加载 | 架构参考 |

**拒绝照搬的行为：** 不采用无授权自动持续训练、不预加载几十 KB 的总纲、不强加特定实验平台、不开新 GPU 实验填补证据空缺、不过度承诺复现或 SOTA。

这些文件为对公开工作流的**原创综合**，不是对原作的翻译或派生拷贝。若以后你从上游直接复制部分 `SKILL.md`/脚本，请分别遵守对应授权（例如 `rseng-agent-skills` 的 Skill 内容可能采用 CC BY 4.0）；在本仓库另建明确来源和许可记录。
