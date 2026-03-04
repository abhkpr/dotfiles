#!/bin/bash

# ============================================
#  DOTFILES INSTALL SCRIPT
#  sets up entire dev environment from scratch
# ============================================

DOTFILES="$HOME/dotfiles"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err()  { echo -e "${RED}[✗]${NC} $1"; }

echo ""
echo "  ✈  dotfiles installer"
echo "  ====================="
echo ""

# ── install packages ──
log "installing packages..."
sudo apt update -q
sudo apt install -y \
    vim-gtk3 \
    git \
    curl \
    i3 \
    alacritty \
    pandoc \
    g++ \
    nodejs \
    npm \
    python3 \
    python3-pip \
    hugo \
    synclient \
    xserver-xorg-input-synaptics \
    feh \
    picom \
    rofi \
    --break-system-packages 2>/dev/null

log "packages installed"

# ── vim plugin manager ──
log "installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
log "vim-plug installed"

# ── symlink configs ──
log "linking config files..."

# vimrc
ln -sf "$DOTFILES/vimrc" ~/.vimrc
log "vimrc linked"

# bashrc — append our stuff instead of replacing
if ! grep -q "DOTFILES MANAGED" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# DOTFILES MANAGED" >> ~/.bashrc
    cat "$DOTFILES/bashrc" >> ~/.bashrc
    log "bashrc updated"
else
    warn "bashrc already set up, skipping"
fi

# alacritty
mkdir -p ~/.config/alacritty
ln -sf "$DOTFILES/config/alacritty.toml" ~/.config/alacritty/alacritty.toml
log "alacritty config linked"

# i3
mkdir -p ~/.config/i3
ln -sf "$DOTFILES/config/i3config" ~/.config/i3/config
log "i3 config linked"

# vim templates
mkdir -p ~/.vim/templates
ln -sf "$DOTFILES/templates/cp.cpp" ~/.vim/templates/cp.cpp
log "vim CP template linked"

# ── set up notes site ──
log "setting up notes site..."
mkdir -p ~/notes-site/{src,output,theme}
cp "$DOTFILES/scripts/build-notes.sh" ~/notes-site/build.sh
chmod +x ~/notes-site/build.sh
cp "$DOTFILES/templates/notes-template.html" ~/notes-site/theme/template.html
log "notes site ready — remember to clone your notes repo"

# ── set up SSH ──
echo ""
warn "SSH key setup — skip if already done"
read -p "generate new SSH key? (y/n): " ssh_answer
if [ "$ssh_answer" = "y" ]; then
    read -p "enter your email: " email
    ssh-keygen -t ed25519 -C "$email"
    echo ""
    log "your public key:"
    cat ~/.ssh/id_ed25519.pub
    echo ""
    warn "add this key to github.com → settings → SSH keys"
    read -p "press enter when done..."
    ssh -T git@github.com
fi

# ── set up git ──
echo ""
read -p "set up git config? (y/n): " git_answer
if [ "$git_answer" = "y" ]; then
    read -p "github username: " git_user
    read -p "github email: " git_email
    git config --global user.name "$git_user"
    git config --global user.email "$git_email"
    git config --global init.defaultBranch main
    log "git configured"
fi

# ── install vim plugins ──
log "installing vim plugins..."
vim +PlugInstall +qall 2>/dev/null
log "vim plugins installed"

# ── clone repos ──
echo ""
warn "cloning your repos..."
read -p "clone notes and website repos? (y/n): " clone_answer
if [ "$clone_answer" = "y" ]; then
    mkdir -p ~/projects
    git clone git@github.com:abhkpr/notes.git ~/notes-site/src 2>/dev/null && log "notes cloned" || err "notes clone failed"
    git clone git@github.com:abhkpr/abhkpr.github.io.git ~/warbird 2>/dev/null && log "website cloned" || err "website clone failed"
fi

echo ""
echo "  ✈  setup complete"
echo "  ================="
echo ""
echo "  next steps:"
echo "  1. source ~/.bashrc"
echo "  2. open vim and run :PlugInstall if needed"
echo "  3. add your API keys to ~/.bashrc"
echo "  4. log out and back in for i3 changes"
echo ""
