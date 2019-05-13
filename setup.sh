# VIM
sudo apt-get install vim -y
sudo apt-get install git -y

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s -f .dotfiles/vim/.vimrc ~/.vimrc

vim +PlugInstall +qall

# youcompleteme
sudo apt install build-essential cmake python3-dev -y
sudo apt install build-essential cmake python3-dev -y
~/.vim/plugged/YouCompleteMe/install.py --clang-completer

# TMUX
sudo apt-get install tmux -y
ln -s -f .dotfiles/tmux/.tmux.conf ~/.tmux.conf

mkdir ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

sudo apt install xclip -y

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

# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# EMACS
ln -s -f .dotfiles/emacs/.emacs.d .emacs.d

