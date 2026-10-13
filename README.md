# arcticpenguin

Кастомный терминал: приветствие с системной инфой и лого дистрибутива + live-данные в промпте. Цвет темы настраивается командой `arctic`.

## Что ставится

| Компонент | Описание |
|-----------|----------|
| `sysgreet` | Системная панель (PC, Distro, Kernel, CPU, RAM, GPU, Packages...) + лого из neofetch + настраиваемый цвет |
| `.zsh_custom` | Кастомный промпт, right-prompt с live-часами/температурой/GPU, aliases, extract, completion menu |
| `arctic` | Интерактивный выбор цвета темы (основной + акцент) из hex-палитры |
| zsh-plugins | `zsh-syntax-highlighting` + `zsh-autosuggestions` |

## Установка

```bash
git clone https://github.com/mihonya-why/arcticpenguin.git ~/arcticpenguin
cd ~/arcticpenguin
./install.sh
source ~/.zshrc
```

## Требования

- zsh
- oh-my-zsh
- glxinfo (для точного определения GPU) — пакет `mesa-utils`
- терминал с поддержкой truecolor (24-bit), например kitty

## Цвета темы

Цвета хранятся в `~/.config/sysgreet/config` и меняются командой `arctic`:

```bash
arctic                 # интерактивный выбор основного и акцентного цвета
arctic --show          # показать текущие цвета
arctic --main "#5f5faf"
arctic --accent "#af0000"
arctic --reset         # вернуть значения по умолчанию
```

Принимаются hex (`#rrggbb`) и номера 256-палитры. Один и тот же конфиг используют и `sysgreet`, и промпт.

## Структура

```
├── install.sh       # скрипт установки
├── sysgreet         # приветствие (bash)
├── arctic           # настройка цветов темы
├── .zsh_custom      # промпт, aliases, live-данные
└── README.md
```

## Что показывает sysgreet

```
  │  PC:       archlinux                           │                       -`
  │  Distro:   Arch Linux                          │                      .o+`
  │  Kernel:   6.x.x                               │                     `ooo/
  │  CPU:      AMD Ryzen 5 3600 (12 cores)         │                    `+oooo:
  │  RAM:      8.3G / 15.5G                        │                   `+oooooo:
  │  GPU:      AMD Radeon RX 570 Series            │                   -+oooooo+:
  │  GPU Temp: 47°C                                │                 `/:-:++oooo+:
  │  Packages: 1270 (pacman)                       │                `/+++++++++++++:
  │  Shell:    zsh                                 │               `/+++++++++++++++:
  │  Terminal: kitty                               │              `/+++oooooooooooooo/
  │  Res:      1920x1080                           │             ./osssssssssssssssso+`
  │  DE:       GNOME                               │            .oossssso-````/osssss+`
  │  WM:       Mutter (GNOME)                      │           -osssssso.      :ssssssso.
  │  Theme:    Adwaita                             │          :osssssss/        osssso+++.
  │  Date:     Mon 31 Aug 2026                     │         /ossssssss/        +ssssooo/-
```

## Live-данные в промпте

Правый промпт обновляется при каждом вводе команды:

```
❯ _
                          23:15 │ gpu:45°C │ up:9h42m
```
