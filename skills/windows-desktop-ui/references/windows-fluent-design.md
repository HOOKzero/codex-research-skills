# Windows Fluent 2 design notes

Use Fluent 2 as a design reference, not a framework migration requirement. Prefer native platform controls and project-consistent tokens.

## Visual language

- Clear type hierarchy, neutral surfaces, subtle separators and restrained accent color.
- Use Segoe UI Variable/system typography when available; respect OS scaling.
- Use semantic tokens for canvas, layer, elevated surface, primary text, secondary text, stroke, accent, danger and focus.
- Prefer modest corner radii and elevation; reserve strong emphasis for primary actions and exceptional status.
- Use a coherent SVG/icon set (Fluent System Icons or another licensed set); avoid emoji and mixed icon styles.

## Behavior

- Familiar Windows title bar, system move/resize/snap, menus, file dialogs and keyboard conventions are preferable to custom chrome.
- Use clear hover/pressed/focus/disabled states; focus must remain visible without hover.
- Use teaching tips/toasts sparingly and never as the only place critical errors are shown.
- Respect system theme and contrast preferences where the framework exposes them.

## Avoid

- Glass/blur everywhere, oversized hero areas in utility apps, card around every group, neon gradients, decorative graphs, gratuitous animations, tiny low-contrast captions, nonstandard controls without accessibility semantics.
- Copying Microsoft product branding, icons or proprietary artwork without permission.
