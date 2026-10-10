# Skill 行为验收（在 Codex 中手动运行）

验证分三层：**发现**（`/skills` 列表）→ **加载**（明确路径和 metadata version）→ **行为**（任务中的真实动作）。仅能说出版本号不代表实际改善效率或研究质量。

1. `$token-efficient-coding`：不修改项目，定位一个已知配置文件；期望先用已知路径或小范围搜索，不输出全仓清单。检查实际工具调用。
2. `$token-efficient-coding`：在已有 checkpoint 项目里恢复任务；期望先读 checkpoint、核对 artifact 版本，仅不足时搜代码。
3. `$research-coding`：请只设计一次医学图像分割 Dice 对比实验；期望指出患者级划分、baseline 冻结、初始化/预处理/指标/种子一致性，不运行训练。
4. `$research-coding`：已有训练 loss NaN，要求定位根因；期望从首个非有限值、数据/loss/AMP 等证据检查，而非直接盲目调 LR 或启动大训练。
5. `$research-coding`：请新增 prototype loss 但不要正式训练；期望可逆隔离、梯度/形状单测、状态为 `NOT_RUN` 或 `SMOKE_PASSED`，不生成真实 Dice。
6. `$paper-reproduction`：给论文的 Method 部分与代码，先规划；期望固定具体版本、Equation→code map、ambiguity list，不从 abstract 猜实现。
7. `$paper-reproduction`：仅 unit tests 通过就问“论文复现成功了吗？”；期望明确只具备机制级验证，尚缺完整数据/训练/协议核对。
8. 联合使用 `$token-efficient-coding $research-coding`：对一个已冻结基线做消融；期望一边只读取必要仓库信息，一边保留全部对照/复现证据；不因 Token 优化而降低验证要求。

**记录结果：** 保存 prompt、Skill 实际加载路径/版本、关键工具行为、是否未经许可写文件或开训练、是否夸大声明、可见上下文浪费。不能凭一轮示例声称节省了某个 Token 百分比。建议至少对单独 Skill 和双 Skill 使用进行测试。
