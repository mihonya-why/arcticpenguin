#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

ok()   { echo -e "  ${GREEN}✓${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
fail() { echo -e "  ${RED}✗${NC} $1"; exit 1; }

echo ""
echo -e "  ${GREEN}██████╗ ██╗   ██╗███████╗${NC}"
echo -e "  ${GREEN}██╔═══╝ ██║   ██║██╔════╝${NC}"
echo -e "  ${GREEN}███████╗██║   ██║███████╗${NC}"
echo -e "  ${GREEN}╚════██║██║   ██║╚════██║${NC}"
echo -e "  ${GREEN}███████║╚██████╔╝███████║${NC}"
echo -e "  ${GREEN}╚══════╝ ╚═════╝ ╚══════╝${NC}"
echo ""

# ── Проверка ОС ──────────────────────────────────────────────────────────────
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    DISTRO="${ID:-unknown}"
else
    DISTRO="unknown"
fi

echo "  Distro: $DISTRO"
echo ""

# ── Установка пакетов ────────────────────────────────────────────────────────
install_packages() {
    case "$DISTRO" in
        arch|manjaro|endeavouros|garuda|artix)
            sudo pacman -S --needed --noconfirm zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null && \
                ok "zsh-plugins (pacman)" || warn "не удалось установить zsh-plugins"
            ;;
        ubuntu|debian|pop|zorin)
            sudo apt-get update -qq && \
            sudo apt-get install -y -qq zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null && \
                ok "zsh-plugins (apt)" || warn "не удалось установить zsh-plugins"
            ;;
        fedora)
            sudo dnf install -y zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null && \
                ok "zsh-plugins (dnf)" || warn "не удалось установить zsh-plugins"
            ;;
        opensuse*|suse*)
            sudo zypper install -y zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null && \
                ok "zsh-plugins (zypper)" || warn "не удалось установить zsh-plugins"
            ;;
        void)
            sudo xbps-install -Sy zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null && \
                ok "zsh-plugins (xbps)" || warn "не удалось установить zsh-plugins"
            ;;
        alpine)
            sudo apk add zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null && \
                ok "zsh-plugins (apk)" || warn "не удалось установить zsh-plugins"
            ;;
        *)
            warn "дистрибутив не распознан — установи zsh-syntax-highlighting и zsh-autosuggestions вручную"
            ;;
    esac
}

echo "  Установка зависимостей..."
install_packages

# ── ~/.local/bin ─────────────────────────────────────────────────────────────
mkdir -p ~/.local/bin

cp "$DOTFILES_DIR/sysgreet" ~/.local/bin/sysgreet
chmod +x ~/.local/bin/sysgreet
ok "sysgreet → ~/.local/bin/sysgreet"

# ── .zsh_custom ──────────────────────────────────────────────────────────────
cp "$DOTFILES_DIR/.zsh_custom" ~/.zsh_custom
ok ".zsh_custom → ~/.zsh_custom"

# ── Патч .zshrc ──────────────────────────────────────────────────────────────
ZSHRC="$HOME/.zshrc"
if [[ ! -f "$ZSHRC" ]]; then
    warn ".zshrc не найден — создай его или установи oh-my-zsh"
else
    if ! grep -q 'source "$HOME/.zsh_custom"' "$ZSHRC"; then
        cat >> "$ZSHRC" << 'EOF'

# ── Кастомные настройки ──────────────────────────────────────────────────────
[[ -f "$HOME/.zsh_custom" ]] && source "$HOME/.zsh_custom"

# ── Приветствие при открытии терминала ────────────────────────────────────────
[[ -x "$HOME/.local/bin/sysgreet" ]] && "$HOME/.local/bin/sysgreet"
EOF
        ok ".zshrc дополнен (sysgreet + .zsh_custom)"
    else
        ok ".zshrc уже настроен"
    fi
fi

# ── PATH ─────────────────────────────────────────────────────────────────────
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    SHELL_RC="$HOME/.zshrc"
    [[ "$SHELL" == */bash ]] && SHELL_RC="$HOME/.bashrc"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    ok "PATH дополнен в $SHELL_RC"
fi

echo ""
echo -e "  ${GREEN}Готово!${NC} Открой новый терминал или выполни:"
echo ""
echo -e "    ${YELLOW}source ~/.zshrc${NC}"
echo ""
