ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
mkdir ~/.vimswap
cd ~/.vim
git submodule init
git submodule update
