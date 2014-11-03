dotvim - vim configuration


git clone https://github.com/tretkow/dotvim .vim

ln -s .vim/vimrc ~/.vimrc
git submodule update --init --recursive
cd .vim/bundle/YouCompleteMe
sudo apt-get install build-essential cmake exuberant-ctags gccgo-go
sudo apt-get install python-dev.
./install.sh --clang-completer

sudo su - -c "mkdir -p /opt/gotags && cd /opt/gotags/ && GOPATH=/opt/gotags go get -u github.com/jstemmer/gotags && ln -s /opt/gotags/bin/gotags /usr/bin"




:helptags


