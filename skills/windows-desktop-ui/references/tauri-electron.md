# Tauri 2 and Electron

## Preserve the existing shell

Inspect frontend framework, package manager/lockfile, Rust/Node versions, native plugins, IPC contracts, CSP and packaging config. Do not replace Tauri with Electron or vice versa for superficial styling.

## Tauri 2

- React is optional; preserve the project's actual frontend.
- Treat capabilities and permissions as security boundaries; grant the smallest plugin/API scope.
- Validate Rust command arguments and data at the IPC boundary; keep long operations off the UI thread.
- On Windows, check WebView2 runtime/bootstrapper assumptions and supported OS versions.
- Build and package with the project's pinned toolchain and verify installer behavior.

## Electron

- Keep context isolation enabled, Node integration disabled in renderers, and use a narrow validated preload API.
- Validate IPC sender and payload; avoid exposing arbitrary filesystem or shell access to renderer code.
- Handle update, signing, installer and auto-launch behavior deliberately.
- Test memory/startup and ensure packaged assets/native modules work outside the dev server.

## Both

Use accessible semantic HTML controls, keyboard support, focus management, responsive desktop window layout, and restrained Fluent-inspired tokens. Validate packaged builds, not only browser dev mode.
