#!/usr/bin/env bash

echo "Starting collection... 📂"

files=(
	"${HOME}/.tmux.conf"
	"${HOME}/.gitconfig"
	"${HOME}/.zshrc"
	"${HOME}/.config/nvim"
	"${HOME}/.p10k.zsh"
)

function copy_file() {
	file_path=$1
	echo "-> 📄 Copying ${file_path} into the repo..."
	cp -Ra $file_path ./
	echo "-> ✅ File ${file_path} has been copied!"
}

for file in ${files[@]}; do
	copy_file "$file"
done
