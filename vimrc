call pathogen#infect()
call pathogen#helptags()
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set incsearch
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P,%{fugitive#statusline()}
colorscheme desert 
set smartcase
set hidden
set ic "case insensitive search
set laststatus=2 "always display status line
set nofoldenable    " disable folding


let sourceDir = "/root/code/has"
let tagsFile = "/root/code/tags"
set tags=%{tagsFile}
:execute ":command Tags !ctags -R --c++-kinds=+p --fields=iaS --extra=+q -f " . tagsFile . " " . sourceDir
:execute ":set tags=" . tagsFile
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F7> :make<CR>
nnoremap <Leader>ff :<C-u>FufFile **/<CR> 
nmap <F8> :TagbarToggle<CR>

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
