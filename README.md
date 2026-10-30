# Codex Research Skills

A reusable, progressively loaded Agent Skill library for research engineering and Windows desktop application development. GitHub is the canonical source; install/link Skills separately in each machine or execution environment.

## Skills

| Skill | Version | Purpose |
|---|---:|---|
| `token-efficient-coding` | 2.2.0 | Scoped repository exploration, efficient tool use and context handoff |
| `research-coding` | 1.0.0 | Deep-learning experiments, baseline protection, fair comparisons and provenance |
| `paper-reproduction` | 1.0.0 | Method extraction, faithful implementation and independent evidence audit |
| `windows-desktop-ui` | 1.0.0 | Framework selection, desktop UX, implementation and real UI verification |

Load selectively: ordinary code work → `$token-efficient-coding`; ML experiments → add `$research-coding`; paper implementation → add `$paper-reproduction`; Windows GUI work → `$windows-desktop-ui`.

## Windows desktop UI Skill

The Skill uses an **Audit → Design → Implement → Verify** workflow. It detects the existing stack and preserves it by default. For greenfield work it evaluates PySide6/Qt Widgets, WinUI 3, WPF, Tauri 2, Electron and Qt Quick/QML based on project evidence, target OS, packaging, dependencies, accessibility and maintenance cost.

Its references are loaded on demand:

- Framework decision matrix and licensing checks
- Desktop UX and Windows Fluent 2
- PySide6, WinUI 3, WPF and Tauri/Electron implementation notes
- Runtime, UI Automation, DPI, theme and interaction verification

The Skill does not claim that a screenshot or successful build proves runtime/interaction correctness. If Windows execution is unavailable, it must mark those checks NOT RUN.

## Windows: link all Skills for Codex projects

```powershell
git clone https://github.com/HOOKzero/codex-research-skills.git "D:\Desktop\codex-research-skills"
cd "D:\Desktop\codex-research-skills"
.\scripts\check-skills.ps1
.\scripts\link-global.ps1 -BackupExisting
```

The global link script discovers every directory under `skills/` and creates junctions in `$HOME\.agents\skills`. Existing conflicting Skills are backed up only when `-BackupExisting` is supplied. No project directories are modified.

To install copies rather than junctions:

```powershell
.\scripts\install-skills.ps1 -Scope User -Backup -Force
```

Update the clone and recheck:

```powershell
git pull --ff-only
.\scripts\check-skills.ps1
```

## Linux / other devices

```bash
git clone https://github.com/HOOKzero/codex-research-skills.git ~/codex-research-skills
mkdir -p ~/.agents/skills
for skill in ~/codex-research-skills/skills/*; do
  name=$(basename "$skill")
  test -e "$HOME/.agents/skills/$name" || ln -s "$skill" "$HOME/.agents/skills/$name"
done
```

Each machine and remote execution environment needs its own clone/link or supported installation. GitHub does not automatically run `git pull` on other devices.

## Repository workflow

Edit under `skills/<name>/`; run `scripts/check-skills.ps1`; perform relevant behavior tests in `tests/behavior-tests.md`; then commit and push. Keep main Skill files concise and place stack-specific details in `references/`.

## Client boundaries

- Codex environments that scan the user-level Agent Skills directory can use these Skills across projects on that machine.
- Other machines, remote servers and cloud environments need separate installation/configuration.
- Ordinary ChatGPT web/mobile chat does not automatically scan this GitHub repository or a local `~/.agents/skills` directory. Do not claim account-wide or cross-device auto-sync.

## Integrity and licensing

Do not upload patient data, credentials, private datasets or model weights to a public repository. Do not claim tests ran unless they did. This repository's original Skill text has no separately declared open-source license; public visibility is not a blanket license to redistribute. Third-party references and license review are recorded in `docs/sources.md`.
