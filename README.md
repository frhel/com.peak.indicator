# DeepSeek Peak Hour Indicator — KDE Plasma 6 Plasmoid

A minimal KDE Plasma 6 panel/taskbar applet that shows whether the current time falls within DeepSeek API peak pricing hours. Displays the DeepSeek whale logo — dimmed with a red dot during peak hours, full color during off-peak.

## Why this exists

DeepSeek announced a **peak-valley pricing mechanism** for the API, effective with the V4 release (mid-July). During peak hours, prices **double**:

| Item | Regular | Peak |
|---|---|---|
| V4 Pro — 1M input (cache hit) | $0.003625 | $0.00725 |
| V4 Pro — 1M input (cache miss) | $0.435 | $0.87 |
| V4 Pro — 1M output | $0.87 | $1.74 |
| V4 Flash — 1M input (cache hit) | $0.0028 | $0.0056 |
| V4 Flash — 1M input (cache miss) | $0.14 | $0.28 |
| V4 Flash — 1M output | $0.28 | $0.56 |

This widget sits next to your clock so you know at a glance whether you're burning double-rate tokens.

## Peak Windows (UTC)

| Window | Hours (UTC) | UTC+8 equivalent (China) |
|---|---|---|
| ⚠ Window 1 | 01:00–04:00 | 09:00–12:00 |
| ⚠ Window 2 | 06:00–10:00 | 14:00–18:00 |

All other hours are off-peak (regular pricing).

## Features

- **Panel mode**: Whale icon — dimmed + red corner dot when peak, bright when off-peak
- **Popup mode**: Plain-text status line with color-coded peak/off-peak message
- Updates every 30 seconds; no subprocesses or external dependencies
- Pure UTC math — immune to DST

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
# Copy to Plasma plasmoids directory
cp -r com.peak.indicator ~/.local/share/plasma/plasmoids/

# Restart Plasma
plasmashell --replace &

# Add to panel: right-click panel → Enter Edit Mode → Add Widget → "DeepSeek Peak Hour Indicator"
```

## License

MIT — do what you want.
