# terminal-setup

Кастомный терминал: приветствие с баннером, системной инфой и лого дистрибутива + live-данные в промпте.

## Что ставится

| Компонент | Описание |
|-----------|----------|
| `sysgreet` | Баннер "WHAT'S THE TIME???" + системная панель (PC, Distro, Kernel, CPU, RAM, GPU, Packages...) + лого из neofetch |
| `.zsh_custom` | Кастомный промпт, right-prompt с live-часами/температурой/GPU, aliases, extract, completion menu |
| zsh-plugins | `zsh-syntax-highlighting` + `zsh-autosuggestions` |

## Установка

```bash
git clone https://github.com/YOUR_USER/terminal-setup.git ~/terminal-setup
cd ~/terminal-setup
./install.sh
source ~/.zshrc
```

## Требования

- zsh
- oh-my-zsh
- glxinfo (для точного определения GPU) — пакет `mesa-utils`
- kitty / другой терминал с поддержкой 256 цветов

## Поддерживаемые дистрибутивы

Arch, Manjaro, EndeavourOS, Garuda, Artix, Ubuntu, Debian, Pop!_OS, Zorin, Fedora, openSUSE, Void, Alpine + другие (через ручную установку плагинов).

## Структура

```
├── install.sh       # скрипт установки
├── sysgreet         # приветствие (bash)
├── .zsh_custom      # промпт, aliases, live-данные
└── README.md
```

## Что показывает sysgreet

```
  █   █ █   █  ███  █████ █  ████   █████ █   █ █████   █████ █████ █   █ █████  ███   ███   ███
  ...

  │  PC:       archlinux                           │    ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖
  │  Distro:   Arch Linux                          │    ▜███▙       ▜███▙  ▟███▛
  │  Kernel:   6.x.x                               │     ▜███▙       ▜███▙▟███▛
  │  CPU:      AMD Ryzen 5 3600 (12 cores)         │      ▜███▙       ▜██████▛
  │  RAM:      8.3G / 15.5G                        │
  │  GPU:      AMD Radeon RX 570 Series            │   ▟█████████████████▙ ▜████▛
  │  GPU Temp: 47°C                                │
  │  Packages: 1270 (pacman)                       │
  │  Shell:    zsh                                 │
  │  Terminal: kitty                               │
  │  Res:      1920x1080                           │
  │  DE:       GNOME                               │
  │  WM:       Mutter (GNOME)                      │
  │  Theme:    Adwaita                             │
  │  Date:     Tue 25 Aug 2026                     │
```

## Live-данные в промпте

Правый промпт обновляется при каждом вводе команды:

```
❯ _
                          23:15 │ gpu:45°C │ up:9h42m
```
