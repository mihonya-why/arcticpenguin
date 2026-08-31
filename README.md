# arcticpenguin

Кастомный терминал: приветствие с баннером, системной инфой и лого дистрибутива + live-данные в промпте. Цвет темы автоматически подстраивается под дистрибутив.

## Что ставится

| Компонент | Описание |
|-----------|----------|
| `sysgreet` | Баннер "ARCTIC PENGUIN" + системная панель (PC, Distro, Kernel, CPU, RAM, GPU, Packages...) + лого из neofetch + цвет под дистрибутив |
| `.zsh_custom` | Кастомный промпт, right-prompt с live-часами/температурой/GPU, aliases, extract, completion menu |
| zsh-plugins | `zsh-syntax-highlighting` + `zsh-autosuggestions` |

## Установка

```bash
git clone https://github.com/YOUR_USER/arcticpenguin.git ~/arcticpenguin
cd ~/arcticpenguin
./install.sh
source ~/.zshrc
```

## Требования

- zsh
- oh-my-zsh
- glxinfo (для точного определения GPU) — пакет `mesa-utils`
- kitty / другой терминал с поддержкой 256 цветов

## Поддерживаемые дистрибутивы (с цветовой темой)

Arch, BlackArch, Artix, EndeavourOS, Garuda, Manjaro, Ubuntu, Debian, Pop!_OS, Zorin, Fedora, openSUSE/SUSE, CentOS/RHEL/Rocky/AlmaLinux, Void, Alpine, NixOS, Gentoo, Linux Mint + другие (с лого и цветом по умолчанию для оставшихся).

## Структура

```
├── install.sh       # скрипт установки
├── sysgreet         # приветствие (bash)
├── .zsh_custom      # промпт, aliases, live-данные
└── README.md
```

## Что показывает sysgreet

```
   ███  ████   ███  █████ ███  ███     ████  █████ █   █  ███  █   █ ███ █   █
  █   █ █   █ █       █    █  █        █   █ █     ██  █ █     █   █  █  ██  █
  █████ ████  █       █    █  █        ████  ████  █ █ █ █  ██ █   █  █  █ █ █
  █   █ █  █  █       █    █  █        █     █     █  ██ █   █ █   █  █  █  ██
  █   █ █   █  ███    █   ███  ███     █     █████ █   █  ███   ███  ███ █   █

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

## Цвет под дистрибутив

Цвет баннера, разделителей и промпта автоматически меняется в зависимости от дистрибутива (arch — голубой, ubuntu — оранжевый, debian — красный, fedora — синий, manjaro — зелёный, blackarch — пурпурный и т.д.).

## Live-данные в промпте

Правый промпт обновляется при каждом вводе команды:

```
❯ _
                          23:15 │ gpu:45°C │ up:9h42m
```
