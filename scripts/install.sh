#!/bin/bash

RECOMMENDED_PKGS='man git fish less ssh rsync curl'

DOTFILES_PATH=~/dotfiles

deploy-dotfiles()
{
  local dotfilesDirPath="${1:-./}"
  local dotfilesPattern="${2:-.*}"
  local targetDirPath="${3:-$HOME}"

  #echo "$dotfilesDirPath"
  #echo "$dotfilesPattern"
  #echo "$targetDirPath"

  cd $dotfilesDirPath

  find ./ -maxdepth 1 -type f -name "$dotfilesPattern" -exec basename {} \; |
    xargs -I XXX bash --norc -c "if [ -e \"$targetDirPath/XXX\" ]; then
      echo already exists: \"$targetDirPath/XXX\";
    else
      ln -s \"$(realpath XXX)\" \"$targetDirPath/XXX\";
    fi"

  cd - >/dev/null
}

cd $DOTFILES_PATH


# neovim
# ==========
neovimDir=~/.config/nvim

if [ ! -d $neovimDir ]; then
  mkdir $neovimDir
fi

deploy-dotfiles "./nvim" "*.vim" "$neovimDir"

## dein
if [ ! -d ~/.cache/dein ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.cache/nvim/dein
fi

if [ ! -d ~/python/neovim3 ]; then
  echo '! You shuld run !'

  echo '# aptitude install python3.5 python3.5-venv'
  echo '$ mkdir -p "$HOME/python && cd $HOME/python"'
  echo '$ python3.5 -m venv neovim3'
  echo '$ . /bin/activate.fish'
  echo '$ pip install neovim'
fi

# Others
# ==========
deploy-dotfiles


