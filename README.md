# DeepSeek Peak Hour Indicator — KDE Plasma 6 Plasmoid

A minimal KDE Plasma 6 panel/taskbar applet that shows whether the current time falls within peak UTC electricity hours. Displays the DeepSeek whale logo — dimmed with a red dot during peak hours, full color during off-peak.

## Peak Windows (UTC)

| Window | Hours (UTC) |
|--------|-------------|
| ⚠ Morning | 01:00–04:00 |
| ⚠ Evening | 06:00–10:00 |

All other hours are considered off-peak.

## Features

- **Panel mode**: Whale icon — dimmed + red corner dot when peak, bright when off-peak
- **Popup mode**: Plain-text status line with color-coded peak/off-peak message
- Updates every 30 seconds; no subprocesses or external dependencies

## Files

```
com.peak.indicator/
├── metadata.json              # Plasma package manifest
├── contents/
│   ├── images/
│   │   └── deepseek.png       # DeepSeek whale logo (112×109)
│   └── ui/
│       └── main.qml           # Plasmoid logic and UI
├── README.md
└── .gitignore
```

## Install

```bash
plasmapkg2 --type plasmoid -i com.peak.indicator/
# or symlink into ~/.local/share/plasma/plasmoids/
```

## License

MIT — do what you want.
