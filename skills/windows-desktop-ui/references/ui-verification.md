# Desktop UI verification

## Evidence ladder

| Level | Evidence | Does not prove |
|---|---|---|
| Static | lint/type checks, resource/XAML/QML parsing, dependency scan | app launches |
| Build | actual successful build/package and exit code | runtime UI works |
| Runtime | launched on Windows, correct process/window observed, logs reviewed | every control works |
| Interaction | controls/dialogs/menus/navigation/file flows exercised and postconditions observed | all DPI/accessibility configurations work |
| Platform/visual | screenshots from running app, multiple sizes/DPI/theme/locale and target OS | unseen environments work |

Report exact commands, environment, exit codes and evidence. Mark unavailable levels NOT RUN.

## Minimum manual checklist

- Launch from clean start and close cleanly.
- Resize, minimize, maximize, restore and use system snap behavior.
- Navigate every primary page; activate all visible buttons and menu items.
- Open/cancel/confirm dialogs and file pickers; verify resulting state or files.
- Test empty, loading, error, disabled and success states.
- Switch light/dark/system themes and inspect contrast.
- Check Chinese text, long labels, scaling, clipping and window minimum size.
- Navigate by keyboard only; verify focus visibility, tab order, Escape behavior and focus restoration.
- Run a long task; confirm UI remains responsive, progress updates, errors surface and cancellation works.
- Inspect logs for exceptions and binding/resource warnings.

## Windows UI Automation

Prefer stable UIA AutomationId, Name and ControlType selectors. UIA must run in the same interactive Windows session and compatible integrity level as the app. SSH/WinRM, services, CI and disconnected sessions may not expose visible UI. Do not elevate or bypass UAC automatically. Use Computer Use or UIA only when actually available; report selector coverage and failed controls.

## Screenshots

Capture screenshots from the running target process at named window sizes and DPI scales. A Figma export, generated mockup, static HTML screenshot or rendered XAML preview is design evidence only, not runtime verification. Compare against acceptance criteria, not subjective "looks good".

## Report template

- Static: PASS/FAIL/NOT RUN — command and output.
- Build: PASS/FAIL/NOT RUN — target/configuration and exit code.
- Runtime: PASS/FAIL/NOT RUN — Windows version, process/window evidence.
- Interaction: PASS/FAIL/NOT RUN — controls exercised and postconditions.
- DPI/theme/locale/accessibility: PASS/FAIL/NOT RUN — conditions covered.
- Remaining risks and reproducible next steps.
