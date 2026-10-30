# WinUI 3 + C#

## Project and lifecycle

Inspect .NET SDK, Windows App SDK, target framework, package identity, unpackaged/packaged mode and minimum Windows build before editing. Prefer current project templates and official Microsoft documentation for version-sensitive APIs.

## Architecture and controls

- Use XAML with MVVM or the existing architecture; keep view state out of services.
- Prefer NavigationView for app-level navigation, CommandBar/AppBarButton for commands, ContentDialog for modal decisions, InfoBar for persistent contextual messages, and ItemsRepeater/ListView for data views when suitable.
- Bind commands and observable state; do not put domain operations in code-behind.
- Use async APIs for I/O and inference; marshal state to UI thread through dispatcher/observable mechanisms.
- Respect windowing, title bar, system backdrop and AppWindow constraints of the targeted Windows App SDK.

## Build and deploy

Use `dotnet --info`, `dotnet list package`, `dotnet build` and the project's existing packaging workflow. Distinguish unpackaged local launch from MSIX package identity and Store signing. Do not enable Developer Mode, install SDKs or change machine settings without approval.
