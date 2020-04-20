set number
unmap Y
let g:python3_host_prog='/usr/bin/python3'

" Cmake plugin
let g:cmake_build_type="Debug"
let g:cmake_project_generator="Ninja"
let g:cmake_compile_commands=1

nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>


set list
set listchars=tab:>-

" header / source
" nnoremap <F4> :A<CR>
" inoremap <F4> <ESC>:A<CR>a

" file under cursor
" nnoremap <F2> :IH<CR>
" inoremap <F2> <ESC>:IH<CR>

set tabstop=4
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4

" colorscheme one
" set background=dark " for the dark version

"nmap <silent><buffer> <F2>  <Plug>(lsp-definition)
"nmap         <buffer> <F2>   <Plug>(lsp-rename)

" let g:lsp_settings = {
" \  'clangd': {'disabled': v:true }
" \}

" FROM: https://github.com/jackguo380/vim-lsp-cxx-highlight/blob/master/sample-configs/vim-lsp-register.vim
"" also see https://github.com/prabirshrestha/vim-lsp/wiki/Servers-ccls
""
"" highlight.lsRanges = true
"" is only necessary if vim doesn't have +byte_offset
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

