# dotfiles ✈

> my personal dev environment. clone and fly.

---

## what's inside

```
dotfiles/
├── vimrc                     → vim config (gruvbox, YCM, CP setup)
├── bashrc                    → aliases, exports, shortcuts
├── config/
│   ├── i3config              → i3 window manager
│   └── alacritty.toml        → terminal (opacity, font, padding)
├── templates/
│   ├── cp.cpp                → C++ competitive programming template
│   └── notes-template.html   → notes site HTML template
├── scripts/
│   └── build-notes.sh        → builds markdown notes to HTML
└── install.sh                → one command setup script
```

---

## fresh install

```bash
# clone the repo
git clone git@github.com:abhkpr/dotfiles.git ~/dotfiles

# run installer
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

the script will:
- install all required packages
- symlink all config files
- set up vim plugins
- configure git
- generate SSH key
- clone your repos

---

## what gets installed

| tool | purpose |
|---|---|
| vim-gtk3 | text editor with clipboard support |
| i3 | tiling window manager |
| alacritty | terminal emulator |
| g++ | C++ compiler |
| hugo | static site generator for main website |
| pandoc | markdown to HTML converter for notes |
| python3 | scripting |
| rofi | app launcher |
| picom | compositor for transparency |
| synclient | touchpad control |

---

## vim setup

| keybind | action |
|---|---|
| `F9` | compile + run C++ |
| `F8` | compile only |
| `F10` | run only |
| `space + e` | toggle file tree |
| `space + w` | save |
| `space + q` | quit |
| `ctrl + h/j/k/l` | move between splits |

auto loads CP template on every new `.cpp` file

---

## bash aliases

```bash
buildnotes    # build and deploy notes site
dtrack        # disable touchpad
track         # enable touchpad
```

---

## workflows

### notes site
```bash
# write a note
nano ~/notes-site/src/notename.md

# add to ORDER in build.sh if new file
nano ~/notes-site/build.sh

# build and deploy
buildnotes
```

### main website (abhishekkumar.xyz)
```bash
# new blog post
nano ~/warbird/content/blog/post-name.md

# new research entry
nano ~/warbird/content/research/research-name.md

# deploy
cd ~/warbird
git add . && git commit -m "post: title" && git push
```

### competitive programming
```bash
# create new problem file
vim problem.cpp
# CP template loads automatically

# inside vim:
# F9 → compile and run
# type input, see output instantly
```

### updating dotfiles
```bash
# after changing any config
cd ~/dotfiles
git add .
git commit -m "update: what changed"
git push
```

---

## machine

```
OS:       Linux Lite 7.6 (Ubuntu 24.04 base)
WM:       i3
Terminal: Alacritty
Editor:   Vim
Shell:    Bash
Hardware: ThinkPad
```

---

## sites

| site | repo | url |
|---|---|---|
| main website | abhkpr.github.io | abhishekkumar.xyz |
| notes | notes | abhkpr.github.io/notes |

---

```
✈  works on my machine. and yours too.
```
