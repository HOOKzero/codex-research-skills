# Desktop UX guidelines

## Information architecture

- Organize around user tasks, not internal class/module names.
- Use a stable primary navigation for a small set of top-level destinations; use contextual navigation for details.
- Keep page titles, current location, primary action and status visible.
- Prefer progressive disclosure over dense settings walls. Keep destructive actions visually distinct and confirm irreversible operations.

## Layout and density

- Use resizable layouts, splitters, size policies, constraints and scrolling; avoid fixed coordinates for general content.
- Establish a small spacing scale and align related controls. Use whitespace and typography before adding containers/cards.
- Make data-heavy screens dense but scannable: stable column alignment, units, sortable headers, meaningful empty states and virtualization for large collections.
- Design for window resize and narrow supported widths; collapse secondary navigation/content before clipping primary controls.
- Support Chinese, English and long translated strings; do not assume labels fit their English width.

## Interaction states

Every interactive control should define applicable rest, hover, pressed, keyboard-focus, selected/checked, disabled, invalid, busy and read-only states. Hover must not be the only way to discover an action. Prevent duplicate submission while busy and show errors near the cause with recovery guidance.

## Keyboard and accessibility

- Tab order follows reading order; shortcuts are discoverable and do not hijack standard OS/application combinations.
- Focus is always visible; restore focus to the invoker after modal dialogs close.
- Provide accessible name, role, value and state for custom controls; icon-only buttons require an accessible name and tooltip.
- Never convey status by color alone. Check contrast for text and meaningful non-text controls.
- Support screen readers through the framework's accessibility APIs; don't replace semantic controls with painted shapes without exposing equivalent semantics.

## Themes and motion

- Use semantic color tokens, not scattered raw color literals.
- Support light/dark and system preference where required; define a high-contrast strategy.
- Motion should explain state transitions, remain short and interruptible, and respect reduced-motion preferences.
- Do not animate layout dimensions continuously or block input while decorative animation runs.

## Data and background work

- Keep UI responsive during inference, file I/O, downloads and data processing.
- Expose progress and cancellation where meaningful; distinguish queued, running, succeeded, failed and cancelled.
- Marshal UI updates to the UI thread. Surface exceptions and preserve logs for diagnosis.
- Use virtualized model/view components for large tables and image lists.
