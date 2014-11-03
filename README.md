# dotvim - vim configuration

## clone
    git clone https://github.com/tretkow/dotvim .vim
    cd .vim
    git submodule update --init --recursive
    ln -s .vim/vimrc ~/.vimrc
    
    
## YouCompleteMe
    sudo apt-get install build-essential cmake exuberant-ctags gccgo-go
    sudo apt-get install python-dev.
    cd .vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

## GoTags
    sudo su - -c "mkdir -p /opt/gotags && cd /opt/gotags/ && GOPATH=/opt/gotags go get -u github.com/jstemmer/gotags && ln -s /opt/gotags/bin/gotags /usr/bin"

## Help
    :helptags





