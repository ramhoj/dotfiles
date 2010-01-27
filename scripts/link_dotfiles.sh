DOTFILES="`pwd`/`dirname "$0"`/.."

ln -nsi $DOTFILES/bash_profile ~/.bash_profile
ln -nsi $DOTFILES/bash ~/.bash
ln -nsi $DOTFILES/gemrc ~/.gemrc
ln -nsi $DOTFILES/gitignore ~/.gitignore
ln -nsi $DOTFILES/irbrc ~/.irbrc
ln -nsi $DOTFILES/railsrc ~/.railsrc
ln -nsi $DOTFILES/rvmrc ~/.rvmrc
ln -nsi $DOTFILES/zlogin ~/.zlogin
ln -nsi $DOTFILES/zshrc ~/.zshrc
ln -nsi $DOTFILES/zsh ~/.zsh

cp -i $DOTFILES/gitconfig ~/.gitconfig
