# WPF + C#

## Architecture

Retain WPF for existing applications unless a hard requirement cannot be met. Use MVVM where it fits: XAML View, ViewModel, ICommand/async commands and services. Preserve established code-behind when a rewrite would add risk without benefit.

## UI implementation

- Use Grid, DockPanel, StackPanel, resource dictionaries, data templates and styles; avoid fixed Canvas layout for general application screens.
- Use ObservableCollection and virtualization for large lists; check virtualization remains enabled with custom templates.
- Use ICommand, async command patterns and INotifyPropertyChanged; avoid async void except framework event boundaries.
- Use ResourceDictionary theme tokens and system-aware theme switching. Select control libraries only after license, version, accessibility and deployment checks.
- Preserve validation, keyboard shortcuts, automation peers and existing binding contracts.

## Validation

Build the actual solution/configuration. Check binding errors, resource lookup, startup window, theme switching, focus navigation and UI Automation. Test DPI/monitor behavior on target Windows rather than inferring it from XAML.
