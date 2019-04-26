# VIM
sudo apt-get install vim -y
sudo apt-get install git -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
ln -s -f .dotfiles/vim/.vimrc ~/.vimrc

vim +PluginInstall +qall

# TMUX
ln -s -f .dotfiles/tmux/.tmux.conf ~/.tmux.conf

# ZSH
ln -s -f .dotfiles/zsh/.zshrc ~/.zshrc

# EMACS
ln -s -f .dotfiles/emacs/.emacs.d .emacs.d

