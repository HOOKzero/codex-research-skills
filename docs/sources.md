# Research sources and attribution

Review date: 2026-10-30. This file records upstream research for original synthesis. No third-party Skill or source tree is vendored by this repository. Repository license metadata is not always sufficient to establish the license of every bundled asset; review file-level notices before copying code, text, icons, fonts, datasets or token snapshots.

## Existing research Skills

| Source | Use in this repository | License handling |
|---|---|---|
| OpenAI skill-creator | Concise instructions and progressive reference loading | Design inspiration; no bulk text copied |
| Context optimization, K-Dense, RSE and ML research Skills | Context efficiency, experiment integrity, provenance and reproducibility | Independently summarized; verify source-specific terms before reuse |

## Windows desktop UI Skill sources

| Upstream project | What was reviewed / learned | License and status observed 2026-10-30 | Decision |
|---|---|---|---|
| [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | Main UI/UX Skill, design-system workflow, UX/accessibility priorities, stack-aware recommendations, searchable knowledge model | Repository metadata reports MIT; actively maintained, main branch updated 2026-10-26. Skill is a large data-backed design system with its own scripts/data | Adopt the principle of task-scoped design guidance and UX checklist; do not vendor its datasets, CLI or Skill text |
| [PySide6 Fluent UI](https://github.com/ejacques11/pyside6-fluent-ui) | PySide6 Widgets mapping, semantic Fluent tokens, theme/QSS architecture, native title-bar concerns, runtime validation | MIT; upstream README/CHANGELOG identifies 0.7.0-rc.1 (2026-07-15) as a public release candidate. Windows 11/Python 3.11/PySide6 6.10.1 validation stated upstream; several platform checks remain open | Use as a focused technical reference, not a production dependency or copied template. Explicitly treat RC status and platform limits as upstream claims |
| [Microsoft Win Dev Skills](https://github.com/microsoft/win-dev-skills) | Current Windows development plugin catalog and WinUI 3 / Windows App SDK workflow; current catalog delegates WinUI implementation to microsoft/winappCli | MIT for repository; THIRD_PARTY_NOTICES separates external tools. README/CHANGELOG updated 2026-10-26; current catalog lists winui as maintained in microsoft/winappCli | Use official Microsoft docs and current WinApp CLI guidance for version-specific details. Do not copy plugin assets or assume the catalog still contains WinUI source |
| [Qt AI Skills](https://github.com/TheQtCompanyRnD/agent-skills) | Qt/QML UI design, review and testing practices; platform-aware design context | GitHub license metadata returned NOASSERTION; LICENSE states LicenseRef-Qt-Commercial OR BSD-3-Clause. This is not treated as blanket permission for copying Skill text | Consulted for concepts only. No copied text, code, tests or assets; licensing ambiguity excludes redistribution |
| [Windows App Automation](https://github.com/youngjunning/windows-app-automation) | Observe → target → act → verify; stable UIA selectors; same-session/integrity constraints; PowerShell UIA testing | MIT; updated 2026-09-11 | Summarized verification principles. No script/helper copied; UIA requires an actual interactive Windows session |
| [WPF Desktop Skill](https://github.com/j4flmao/agent-skills/tree/main/skills/desktop/wpf) | WPF/XAML/MVVM patterns and preservation of existing WPF projects | Repository MIT; source Skill declares MIT. Updated 2026-10-28 | Independently summarized WPF architecture and test concerns; no bulk text or code copied |

## License and attribution policy

- GitHub repository `license` metadata is a useful signal, not proof that every asset in a repository shares that license.
- For MIT sources, substantial copied portions would require retaining the original copyright and permission notice. This Skill instead uses original summaries and does not redistribute their code or assets.
- Qt AI Skills is excluded from copying because its declared dual license requires interpretation and GitHub reports NOASSERTION.
- Microsoft product names are used descriptively. No Microsoft logo, proprietary artwork, fonts or icon assets are redistributed.
- Frameworks, controls, icon packs, fonts, WebView2, Qt modules and packaging tools carry their own licenses. Check exact versions and distribution model before shipping.
- This repository currently has no root LICENSE for its original Skill content. Do not imply that upstream MIT licenses automatically license this repository.

## Maintenance

Recheck upstream README, SKILL, LICENSE, release/changelog and commit history before importing any material or making version-specific claims. Distinguish stable releases from RC, preview and experimental features. Keep a date and source link for each material change.
