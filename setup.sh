# VIM
sudo apt-get install vim -y
sudo apt-get install git -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
ln -s -f .dotfiles/vim/.vimrc ~/.vimrc

vim +PluginInstall +qall

# TMUX
sudo apt-get install tmux -y
ln -s -f .dotfiles/tmux/.tmux.conf ~/.tmux.conf

mkdir ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# ZSH
sudo apt-get install curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s -f .dotfiles/zsh/.zshrc ~/.zshrc

# autojump
sudo apt-get install autojump -y
# git clone git://github.com/wting/autojump.git
# cd autojump
# ./install.py
# cd ..
# rm -rf autojump

# not sure if needed
sudo apt-get install fonts-powerline -y
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# EMACS
ln -s -f .dotfiles/emacs/.emacs.d .emacs.d

