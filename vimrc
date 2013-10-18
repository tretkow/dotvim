execute pathogen#infect()
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set incsearch
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P,%{fugitive#statusline()}
colorscheme darkblue
set smartcase
set hidden
set ic "case insensitive search
set laststatus=2 "always display status line
set nofoldenable    " disable folding
set t_Co=256
if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif



"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 50
"map <F4> :TlistToggle<CR>
"map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"#map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"set tags=tags;

let sourceDir = "/root/has"
let tagsFile = "/root/tags"
set tags=%{tagsFile}
:execute ":command Tags !ctags -R --c++-kinds=+p --fields=iaS --extra=+q -f " . tagsFile . " " . sourceDir
:execute ":set tags=" . tagsFile
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F7> :make<CR>

au BufReadPost fugitive://* set bufhidden=delete


