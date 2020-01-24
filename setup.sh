# GIT
echo ""
echo "INSTALL GIT"
echo ""
sudo apt-get install git -y

# PYTHON
echo ""
echo "INSTALL PYTHON"
echo ""
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt-get install virtualenv -y
sudo ln -fs /usr/bin/python3 /usr/bin/python
sudo ln -fs /usr/bin/pip3 /usr/bin/pip
# pip3 install notedown

# VIM
echo ""
echo "INSTALL VIM"
echo ""
sudo apt-get install vim -y
sudo apt-get install vim-gtk -y
sudo apt-get install git -y

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s -f .dotfiles/vim/.vimrc ~/.vimrc

vim +PlugInstall +qall

# python
# pdb
ln -s -f .dotfiles/python/.pdbrc.py ~/.pdbrc.py

# youcompleteme
echo ""
echo "INSTALL YOUCOMPLETEME"
echo ""
sudo apt install build-essential cmake python3-dev -y
sudo apt install build-essential cmake python3-dev -y
git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
~/.vim/plugged/YouCompleteMe/install.py --clang-completer

# ZSH
echo ""
echo "INSTALL ZSH"
echo ""
sudo apt-get install zsh -y
sudo apt-get install curl -y
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s -f .dotfiles/zsh/.zshrc ~/.zshrc

chsh -s $(which zsh)

# Bullet-train
sudo wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P $ZSH_CUSTOM/themes/

# TMUX
echo ""
echo "INSTALL TMUX"
echo ""
sudo apt-get install tmux -y
sudo apt-get install tmuxinator -y
ln -s -f .dotfiles/tmux/.tmux.conf ~/.tmux.conf

mkdir ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

sudo apt install xclip -y

# autojump
echo ""
echo "INSTALL AUTOJUMP"
echo ""
#sudo apt-get install autojump -y
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
cd ..
rm -rf autojump
echo "[[ -s /home/${USER}/.autojump/etc/profile.d/autojump.sh ]] && source /home/${USER}/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc

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

