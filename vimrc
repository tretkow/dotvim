call pathogen#infect()
call pathogen#helptags()
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set incsearch
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P,%{fugitive#statusline()}
colorscheme molokai
set smartcase
set hidden
set ic "case insensitive search
set laststatus=2 "always display status line
set nofoldenable    " disable folding
set hlsearch
set nocompatible
set t_Co=256
set wildignore+=tags "do to search tags during vimgrep
syntax on

function CreateTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    let tagFile = curNodePath . '/tags'
    exec ':!ctags -R --c++-kinds=+p --fields=iaS --extra=+q -f ' . tagFile . ' ' . curNodePath
    execute "set tags=" . tagFile
endfunction

function LoadTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    let tagFile = curNodePath . '/tags'
    execute "set tags=" . tagFile
endfunction

:execute ":command Tags :call CreateTags()<CR>"
nmap <silent> <F9> :call LoadTags()<CR>

:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F7> :make<CR>
nnoremap <Leader>ff :<C-u>FufFile **/<CR> 
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>jd :YcmCompleter GoTo<CR>
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-j>   :tabnext<CR>
nnoremap <C-i> :tabnew<CR>
"nnoremap <C-r> :tabclose<CR>

"au BufReadPost fugitive://* set bufhidden=delete

"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 " don't check on :wq and :x
let g:syntastic_enable_signs = 1 " errors on left side
"let g:syntastic_auto_loc_list = 2 " only show window when I ask
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" the command
command! -nargs=1 -complete=customlist,GoFilesComplete GoFile call GoFile(<f-args>)

" the completion function
function! GoFilesComplete(ArgLead, CmdLine, CursorPos)
    return filter(go#tool#Files(), 'v:val =~ a:ArgLead')
endfunction

" the :edit wrapper
function GoFile(file)
    execute "edit " . a:file
endfunction

" nerd tree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-t> :NERDTreeToggle<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" split resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

imap jj <ESC> 

map ss :e $MYVIMRC<CR>
