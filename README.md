# dotfiles ✈

my personal dev environment setup.

## what's included

- vim config with CP setup, gruvbox theme, YCM autocomplete
- i3 window manager config
- alacritty terminal config
- bash aliases and exports
- competitive programming C++ template
- notes site build script

## fresh install
```bash
git clone git@github.com:abhkpr/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## workflow

### notes
```bash
# edit a note
nano ~/notes-site/src/notename.md

# build and deploy
buildnotes
```

### main website
```bash
# new blog post
nano ~/warbird/content/blog/post-name.md

# deploy
cd ~/warbird && git add . && git commit -m "post: title" && git push
```

### competitive programming
```bash
# new problem
vim problem.cpp  # template loads automatically

# compile and run
# press F9 inside vim
```

## machines
- ThinkPad, Linux Lite 7.6, i3wm
