---
name: windows-desktop-ui
description: >
  Audit, design, implement, and verify professional Windows desktop application interfaces.
  Use for new or existing Win32, WinUI 3, WPF, PySide6/Qt Widgets, Qt Quick/QML,
  Tauri, and Electron desktop applications. Select the stack from repository evidence,
  preserve existing architecture and business behavior, and verify actual runtime and
  interaction states when a suitable Windows environment is available.
metadata:
  version: "1.0.0"
---

# Windows Desktop UI Engineering

Build usable, maintainable Windows desktop interfaces—not static mockups. Work through **Audit → Design → Implement → Verify**, scaling each stage to the requested scope. Prefer restrained Windows Fluent 2 patterns, clear information hierarchy, native behavior, accessibility, and evidence-backed verification.

## Trigger and scope

Use for new desktop applications, UI modernization, window/navigation/layout work, dialogs, themes, accessibility, DPI/resizing defects, desktop automation, and visual acceptance. Do not use for backend-only tasks unless their UI integration is in scope.

## Non-negotiable constraints

- Inspect the repository before choosing a framework. Preserve an existing working GUI stack by default.
- Do not rewrite algorithms, model inference, data pipelines, public APIs, persistence formats, or backend contracts for visual polish.
- Separate presentation from domain logic and I/O. Use the project's established architecture (MVVM, controller/service, model-view, or equivalent).
- Do not claim runtime or interaction verification from code inspection, compilation, or screenshots alone.
- Do not install SDKs, system components, drivers, or packages globally without authorization. Prefer project-local dependencies.
- Never put secrets, patient data, proprietary assets, or credentials into screenshots, logs, prompts, or public artifacts.
- Audit mode is read-only. Do not edit files during Audit unless the user explicitly changes the scope.

## Phase 1 — Audit (read-only)

Inventory the repository and report evidence for:

1. Project structure, entry points, build system, runtime and target Windows versions.
2. Existing GUI framework, dependencies, versions, UI component libraries and theme resources.
3. Main window, navigation, page/view hierarchy, dialogs, menus, tables, charts and custom controls.
4. Event flow, state management, async/background work, cancellation and error handling.
5. Design tokens, typography, icon sources, light/dark/system theme support.
6. Window sizing, responsive layout, minimum dimensions, monitor/DPI behavior and high-DPI assets.
7. Accessibility names/roles, keyboard order, shortcuts, focus visibility, screen-reader semantics and contrast.
8. Existing tests, automation IDs, launch/build commands, CI and known regressions.

Use targeted searches and inspect only relevant files. Distinguish observed facts from assumptions. Record behaviors and interfaces that must not change. Audit output: stack and version, architecture map, strengths/gaps, risks, protected behavior, and recommended bounded changes. No edits.

## Phase 2 — Design

Create a concise design specification before substantial implementation:

- Information architecture and user tasks.
- Window shell, navigation model, page hierarchy and content priority.
- Component inventory and reusable interaction patterns.
- Semantic color, typography, spacing, density, radius, elevation and icon tokens.
- Light/dark/system theme behavior; define high-contrast path.
- Empty, loading, success, warning, error, disabled, selected and destructive states.
- Keyboard flow, focus restoration, accessible labels and localization/long-text behavior.
- Resize behavior, minimum supported size and DPI scaling.

Prefer Fluent 2 principles where appropriate: clear hierarchy, calm surfaces, consistent spacing, purposeful accent color, familiar Windows controls, restrained motion and meaningful feedback. Fluent 2 is a design language, not a mandate to migrate to WinUI. Avoid gratuitous gradients, excessive cards, decorative charts, emoji icons, tiny low-contrast text, fixed pixel layouts and animations that delay work.

Do not interrogate the user for details discoverable from the project. Make reasonable reversible choices and state assumptions. Ask only if a genuinely blocking product decision cannot be inferred.

## Phase 3 — Select the technology stack

Read `references/framework-selection.md`. Detect existing framework from solution/project files and dependencies. Prefer the existing stack unless a documented requirement cannot be met. For a new project, compare at least the plausible candidates and give a short decision report: selected stack, evidence, alternatives rejected, deployment/runtime requirements, compatibility and maintenance cost.

Decision defaults (not hard rules):
- Python/PyTorch/OpenCV tooling: evaluate PySide6 + Qt Widgets first.
- New Windows-native app: evaluate WinUI 3 + C# first.
- Existing enterprise XAML / WPF app: retain WPF.
- Existing Tauri or Electron: retain its current architecture.
- Highly custom cross-platform Qt UI: evaluate Qt Quick/QML.
- Tauri 2 + React suits a web UI with a smaller native shell; Electron suits an established Node/web ecosystem where its broader runtime is justified.

Never migrate just to obtain a Fluent appearance. Verify the current official SDK/runtime requirements before changing target frameworks; don't assume latest versions are installed.

## Phase 4 — Implement incrementally

1. Confirm scope, protected paths, entry point and test/build command.
2. Define or reuse semantic tokens and shared components; avoid one-off styling scattered through views.
3. Build shell/navigation and one representative page before broad rollout.
4. Wire controls to real commands/services/state. Every visible action must have a meaningful behavior or be explicitly disabled with an explanation.
5. Put blocking I/O, inference and long computations off the UI thread. Provide progress, cancellation where feasible, exception reporting and safe UI-thread updates.
6. Implement dialogs, menus, file pickers, table/list models, empty/loading/error states and theme switching using native framework mechanisms.
7. Keep changes bounded. Do not fabricate demo data in production paths or silently change business logic.
8. Add stable automation/accessibility identifiers to important controls and meaningful names/roles.

Framework details are in references. Load only what applies.

## Phase 5 — Verify

Read `references/ui-verification.md`. Use the strongest available evidence and report each level separately:

- **Static:** formatting, lint, type checks, XAML/QML/QSS parsing, dependency and accessibility-ID inspection.
- **Build:** actual successful build/package command and exit code.
- **Runtime:** launch on Windows, observe the actual window/process, inspect logs and close cleanly.
- **Interaction:** exercise real controls, dialogs, menus, file selection, navigation, themes, keyboard and background tasks; verify postconditions.
- **Visual/platform:** screenshots from the running app, representative window sizes, DPI scales/monitors, Chinese text and light/dark/high-contrast behavior.
- **Automation:** UI Automation/Computer Use selectors and assertions where available.

A screenshot of a mockup, generated image or static render is not runtime evidence. A successful build is not interaction evidence. If Windows is unavailable, explicitly mark runtime/UIA/DPI verification **NOT RUN** and provide reproducible commands for the user. Do not simulate results or claim tests passed without execution evidence.

## Deliverables

For a substantive task report: Audit findings; selected stack and rationale; design decisions; changed files; preserved behavior; build/runtime/interaction/visual tests with exact commands and outcomes; platform limitations; unresolved risks. Keep evidence concise and reproducible.

## Progressive references

Load only relevant files:
- Stack selection: `references/framework-selection.md`
- General desktop UX: `references/desktop-ux-guidelines.md`
- Fluent 2: `references/windows-fluent-design.md`
- PySide6: `references/pyside6-qt-widgets.md`
- WinUI 3: `references/winui3.md`
- WPF: `references/wpf.md`
- Tauri/Electron: `references/tauri-electron.md`
- Test and evidence ladder: `references/ui-verification.md`
