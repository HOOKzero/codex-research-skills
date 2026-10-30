# Skill behavior acceptance tests

Run manually in a Codex environment that can load the Skills. Record prompt, loaded Skill path/version, tool actions, actual command output and evidence. A correct plan alone does not prove runtime behavior.

## Existing research Skills

1. `$token-efficient-coding`: locate one known config file without broad repository dumps.
2. `$token-efficient-coding`: resume from a checkpoint and verify artifact version before searching.
3. `$research-coding`: design a patient-level medical segmentation Dice comparison without launching training.
4. `$research-coding`: diagnose NaN from first non-finite evidence, not blind LR changes.
5. `$paper-reproduction`: map equations to code and tests; do not claim paper-level reproduction from a smoke test.

## Windows desktop UI — expected behavior

### A. Python deep-learning image tool

Prompt: "Create a Windows desktop image-processing tool using PyTorch and OpenCV. The GUI framework is not specified."

Expected: inspect repository/runtime requirements; evaluate PySide6 + Qt Widgets first; keep inference and file I/O off the GUI thread; explain packaging/CUDA/plugin risks. Do not ask the user to choose a framework if repository evidence is sufficient.

### B. New Windows-native management app

Prompt: "Build a modern native Windows desktop management application. No framework specified."

Expected: evaluate WinUI 3 + C# first, compare WPF if data-heavy controls/legacy needs justify it; do not default to Electron without a requirement.

### C. Existing WPF project

Prompt: "Modernize the UI of this existing WPF application."

Expected: retain WPF and its bindings/MVVM/contracts; audit read-only first; no framework migration absent explicit evidence and approval.

### D. Existing Tauri project

Prompt: "Improve the desktop UI of this existing Tauri app."

Expected: detect Tauri version/frontend/IPC and preserve architecture; do not migrate to Electron or add an unrelated native shell.

### E. Full UI workflow

Prompt: "Improve this desktop application's interface."

Expected: perform Audit read-only; specify information architecture/tokens/states; implement bounded changes only after scope is authorized; run build, launch the real app, exercise controls and report evidence levels separately. If Windows runtime is unavailable, mark runtime/UIA/DPI tests NOT RUN.

## Static repository acceptance

- `scripts/check-skills.ps1` succeeds on Windows PowerShell 5.1 or PowerShell 7 (where available).
- All Skill front matter starts/ends correctly; name equals directory; semantic version is present.
- Every referenced local `references/` or `assets/` file exists.
- windows-desktop-ui reports version 1.0.0.
- `install-skills.ps1` default list includes windows-desktop-ui.
- `link-global.ps1` discovers it automatically without special-case edits.
- Existing Skill contents are unchanged by this feature branch.
- No upstream Skill text/assets are copied wholesale.

## Verification honesty

Mark each check PASS / FAIL / NOT RUN with command and evidence. Static validation does not prove runtime; build does not prove UI interaction; screenshots of mockups do not prove application behavior. Do not invent test output.
