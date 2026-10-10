# Codex Research Skills

面向科研编码、论文复现及高效上下文管理的轻量 Codex Skill 库。GitHub 是源码的唯一主仓库；在各台机器的用户级 Skill 目录中安装或链接，供该机器上的多个 Codex 项目使用。

## Skills

| Skill | Version | 用途 |
| --- | --- | --- |
| `token-efficient-coding` | 2.2.0 | 缩小检索范围、控制工具输出、恢复长期任务上下文 |
| `research-coding` | 1.0.0 | 深度学习实验、baseline 保护、公平比较、GPU 资源与可复现性 |
| `paper-reproduction` | 1.0.0 | 论文方法抽取、公式映射、忠实实现、独立结果验证 |

选择性使用，避免三套 Skill 在简单任务中同时加载：普通代码任务 `$token-efficient-coding`；科研训练可加 `$research-coding`；论文实现可加 `$paper-reproduction`。

## Windows：从 GitHub 安装为所有 Codex 项目可用

```powershell
git clone https://github.com/HOOKzero/codex-research-skills.git "D:\Desktop\codex-research-skills"
cd "D:\Desktop\codex-research-skills"
.\scripts\check-skills.ps1
.\scripts\link-global.ps1 -BackupExisting
```

此脚本为三个 Skill 在 `$HOME\.agents\skills` 中建立 Windows junction，指向本地 Git 克隆目录；**不会修改任何具体科研项目**。若执行策略禁止脚本运行，可在当前 PowerShell 进程中执行 `Set-ExecutionPolicy -Scope Process Bypass`。如想安装副本而非链接，可使用 `install-skills.ps1 -Scope User -Backup -Force`，但以后每次更新需要重新运行安装。

更新同一机器上的全部项目：

```powershell
cd "D:\Desktop\codex-research-skills"
git pull --ff-only
.\scripts\check-skills.ps1
```

因为使用 junction，共用目录会立即指向新版本；如果 Codex 没有发现变更，重启 Codex 或新建会话后再查看 `/skills`。

> 旧项目如果还保留 `.codex/skills/token-efficient-coding` 等同名旧版本，请先备份，检查 `/skills` 中的来源路径，再移走重复版本，防止混用。不确定时不要自动删除。

## Linux / 其他设备

```bash
git clone https://github.com/HOOKzero/codex-research-skills.git ~/codex-research-skills
mkdir -p ~/.agents/skills
ln -s ~/codex-research-skills/skills/token-efficient-coding ~/.agents/skills/token-efficient-coding
ln -s ~/codex-research-skills/skills/research-coding ~/.agents/skills/research-coding
ln -s ~/codex-research-skills/skills/paper-reproduction ~/.agents/skills/paper-reproduction
```

创建链接前确认目标不存在；若已经安装同名 Skill，先备份以免冲突。服务器和每台新电脑都要各自克隆和链接，GitHub 的提交不会自动在所有设备执行 `git pull`。

## GitHub 作为唯一主仓库

在克隆目录的 `skills/` 下修改 → `check-skills.ps1` → Codex 行为测试（`tests/behavior-tests.md`）→ Git commit/push → 其他设备 `git pull --ff-only`。保持 Skill 主文件短小，引用资料只在相关任务中按需加载。

- `research-coding/references/`：实验公平性、训练诊断、医学分割专项规则
- `research-coding/assets/run-manifest.template.json`：实验来源记录模板
- `paper-reproduction/references/`：公式/方法提取与复现验证
- `docs/sources.md`：参考项目来源、内容取舍与许可证说明
- `docs/project-AGENTS-template.md`：项目级配置模板（路径、环境、保护目录写在项目里）

## 各客户端的真实边界

- **同一电脑、同一用户环境下的 Codex CLI/IDE**：用户级安装使 Skill 可用于多个项目。
- **其他电脑、Linux/远程服务器或云环境**：必须在各自的 Codex 执行环境单独安装或配置。
- **普通 ChatGPT 网页和手机聊天**：**不会**自动扫描 GitHub 仓库，也不会读取本机 `$HOME/.agents/skills`。需要所用产品支持的独立 Skill/Plugin 安装途径；不能承诺全账户、全设备立即同步。

根目录 `plugin.json` 仅为后续研究 Plugin 分发的**实验性清单**，未在 ChatGPT Plugin 安装流程中验证；**不能仅靠此文件实现 ChatGPT 全端通用**。

## 科研完整性

任何正式训练都应遵循项目级授权、GPU 预算、数据及权重来源、验证协议。不要上传患者数据、保密数据集或模型权重到公开仓库。未运行的实验必须明确标记 `NOT_RUN`，不能将代码跑通误当作科研结果通过。项目中特有的禁止修改路径放入项目 `AGENTS.md`。

**许可证提示：** 此仓库尚未为原创 Skill 选定开源许可证；公开可见不等于授予第三方任意复用许可。引用了第三方项目设计思想，详见 `docs/sources.md`。
