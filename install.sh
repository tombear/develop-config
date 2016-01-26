#!/bin/sh
CONFIG_HOME=~/.config

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "~/.config" ] && die "~/.config already exists."

git clone git@github.com:tombear/develop-config.git "$CONFIG_HOME"

cd "$CONFIG_HOME"
git submodule update --init

cd ~
ln -s .config/.vim .vim
ln -s .config/.vim/.vimrc .vimrc
ln -s .config/.zshrc .zshrc
ln -s .config/.tmux.conf .tmux.conf
ln -s .config/.gitconfig .gitconfig

cd "${CONFIG_HOME}/.vim"
git submodule update --init

echo "Your develope Environiment has been Setup."

cd "$CONFIG_HOME"
