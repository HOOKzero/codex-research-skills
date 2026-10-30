# Framework selection

## Evidence-first decision

Inspect the project before recommending anything: `*.sln`, `*.csproj`, `Directory.Build.*`, `global.json`, `pyproject.toml`, `requirements*.txt`, `package.json`, `Cargo.toml`, `CMakeLists.txt`, QML modules, lockfiles, CI workflows, deployment scripts and existing UI source. Record installed and pinned versions; do not infer them from documentation examples.

## Decision matrix

| Stack | Best fit | Strengths | Costs / checks |
|---|---|---|---|
| PySide6 + Qt Widgets | Python, PyTorch/OpenCV tooling, internal scientific utilities | Python ecosystem, mature widgets/model-view, desktop-native dialogs | Python runtime and Qt plugin packaging; wheel/platform compatibility; threading and GIL; LGPL/commercial Qt obligations |
| WinUI 3 + C# | New Windows-native applications | Modern Windows App SDK controls, XAML, Windows integration | Windows-only; .NET + Windows App SDK deployment, packaging/identity and supported OS baseline |
| WPF + C# | Existing/enterprise line-of-business applications | Mature XAML, binding/templates, broad ecosystem and controls | Windows-only; modern Fluent look requires styling library/tokens; retain .NET Framework constraints in legacy apps |
| Tauri 2 + React | Cross-platform app with web UI and small native host | Rust host, web UI ecosystem, smaller runtime footprint than typical Electron | Rust toolchain, WebView2 on Windows, plugin/capability permissions, frontend/native boundary |
| Electron + React | Existing Node/web products and rich web ecosystem | Mature web tooling, consistent bundled Chromium/Node behavior | Larger package/runtime and memory footprint; security hardening, update/signing and IPC discipline |
| Qt Quick + QML | Highly custom, animated, touch-oriented Qt UI | Declarative UI, fluid custom composition, Qt cross-platform | QML/C++ or Python integration, tooling and team expertise; avoid migrating Widgets solely for styling |

## Selection rules

1. Existing production stack wins unless it blocks a hard requirement or is unmaintainable; migration needs explicit benefit/cost.
2. Python ML/computer-vision project: evaluate PySide6 Widgets first; choose QML only for a concrete custom/animated UI need.
3. Greenfield Windows-only native product: evaluate WinUI 3 first, but compare WPF when data-heavy enterprise controls, legacy libraries or team expertise matter.
4. Existing WPF, WinUI, Qt, Tauri or Electron: preserve its architecture.
5. Cross-platform requirement: clarify supported OSes and evaluate Qt/Tauri/Electron against packaging, native integrations and team skills.
6. Evaluate accessibility, UIA automation, DPI, localization, startup/memory, background jobs, installer/update strategy, signing, licensing and maintenance.
7. Do not select based only on screenshot aesthetics or popularity.

## Required concise decision report

- Detected stack and evidence (files/dependencies/versions).
- Requirements and target Windows versions.
- Selected framework and why it fits.
- Plausible alternatives and why rejected.
- Runtime/SDK/build tools and deployment implications.
- Risks, license checks and what needs confirmation.

## Licensing notes

Check current framework and third-party component licenses for the exact versions shipped. PySide6/Qt distribution may involve LGPLv3/GPLv3 or commercial licensing depending on modules, modifications, distribution and compliance; do not give legal conclusions. WebView2, Windows App SDK, fonts, icons and UI component libraries each have separate terms. Include notices when redistributing third-party assets.
