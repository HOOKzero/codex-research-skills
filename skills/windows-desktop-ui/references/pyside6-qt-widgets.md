# PySide6 + Qt Widgets

## Architecture

Prefer Qt Widgets for Python desktop utilities, especially when integrating PyTorch/OpenCV. Separate:
- Views/widgets: layout, rendering and user input.
- Controllers/ViewModels: state and commands.
- Services: filesystem, inference, network and domain operations.
- Models: Qt model/view data contracts.

Reuse existing project conventions; do not add an elaborate architecture to a tiny utility.

## Implementation

- Use layouts, size policies, splitters, QDialog, QFileDialog, QMenu and QTableView/QAbstractTableModel rather than fixed geometry and hand-built tables.
- Keep long inference/file operations off the GUI thread using QThread, QObject worker signals or an established async abstraction. Never update widgets from worker threads.
- Handle cancellation, exceptions and progress; disable duplicate actions during a job.
- Use QSettings for appropriate user preferences; preserve existing config formats.
- Prefer QPalette and a centralized semantic QSS/theme manager. Avoid scattered per-widget setStyleSheet calls.
- Use stable objectName/accessibility metadata for automation. Test keyboard focus and tab order.

## Packaging

Check Python version, PySide6 version, Qt plugins, image codecs, CUDA dependencies, model weights and licenses. PyInstaller/Nuitka packaging must be tested on a clean Windows machine/VM; development imports do not prove distributable packaging works. Keep large ML weights external or downloaded through a documented, integrity-checked workflow when appropriate.
