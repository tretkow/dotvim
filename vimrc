execute pathogen#infect()
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set incsearch
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P,%{fugitive#statusline()}
colorscheme distinguished 
set smartcase
set hidden
set ic "case insensitive search
set laststatus=2 "always display status line
set nofoldenable    " disable folding


let sourceDir = "/root/has"
let tagsFile = "/root/tags"
set tags=%{tagsFile}
:execute ":command Tags !ctags -R --c++-kinds=+p --fields=iaS --extra=+q -f " . tagsFile . " " . sourceDir
:execute ":set tags=" . tagsFile
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F7> :make<CR>

"au BufReadPost fugitive://* set bufhidden=delete


