# GIT
echo ""
echo "INSTALL GIT"
echo ""
sudo apt-get install git -y
# ln -s -f git/.gitconfig ~/.gitconfig
# ln -s -f git/.gitignore ~/.gitignore

# PYTHON
echo ""
echo "INSTALL PYTHON"
echo ""
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt-get install virtualenv -y
sudo ln -fs /usr/bin/python3 /usr/bin/python
sudo ln -fs /usr/bin/pip3 /usr/bin/pip

# PYENV
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl

curl https://pyenv.run | bash

# POETRY
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python


# VIM
echo ""
echo "INSTALL VIM"
echo ""
sudo apt-get install vim -y
sudo apt-get install vim-gtk -y
sudo apt-get install git -y

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s -f ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s -f ~/.dotfiles/vim/ftplugin ~/.vim/ftplugin

vim +PlugInstall +qall

# python
# pdb
ln -s -f .dotfiles/python/.pdbrc.py ~/.pdbrc.py

# youcompleteme legacy
# echo ""
# echo "INSTALL YOUCOMPLETEME"
# echo ""
# sudo apt install build-essential cmake python3-dev -y
# sudo apt install build-essential cmake python3-dev -y
# git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
# ~/.vim/plugged/YouCompleteMe/install.py --clang-completer

# deoplete
pip3 install --user pynvim
pip install msgpack

# NEOVIM
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt install python-neovim
sudo apt install python3-neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip

pyenv virtualenv 2.7.14 neovim2
pyenv activate neovim2
pip install neovim
pyenv deactivate

pyenv virtualenv 3.6.10 neovim3
pyenv activate neovim3
pip install neovim
# used for snippets
pip install python-slugify 
pyenv deactivate

mkdir ~/.config/nvim
ln -s -f ~/.dotfiles/neovim/init.vim ~/.config/nvim/init.vim

# install jq for json formatting
sudo apt-get install jq -y

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
gem install tmuxinator
# tmuxinator completions
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator
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
ln -s -f ~/.emacs.d ~/.dotfiles/emacs/.emacs.d
