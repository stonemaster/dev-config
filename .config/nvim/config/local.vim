set number
unmap Y

let g:python3_host_prog='/usr/bin/python3'

" Cmake plugin
let g:cmake_build_type="Debug"
let g:cmake_usr_args="-GNinja"
let g:cmake_compile_commands=1
let g:enable_universal_quit_mapping = 0

nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

set list
set listchars=tab:>-
set redrawtime=15000  " Time in milliseconds for stopping display redraw

" Override rafi default to not open vsplits
" default currently is: set switchbuf=useopen,vsplit    " Jump to the first open window
set switchbuf=usetab

" Write the contents of the file, if it has been modified, on each :next,
" :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!, :make, CTRL-] 
" and CTRL-^ command; and when a :buffer, CTRL-O, CTRL-I, '{A-Z0-9}, or `{A-Z0-9} command takes one to another file.
" from https://stackoverflow.com/questions/12077897/autosave-buffer-on-make-in-vim
set autowrite

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set tabstop=4
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4

" default: colorscheme hybrid
colorscheme gruvbox
set background=dark " for the dark version

" lua << EOF
" 
" require'lspconfig'.ccls.setup {
"  cmd = { "ccls-wrapper" }
" }
" 
" -- require'nvim_lsp'.clangd.setup {}
" 
" EOF

" Set compiler: https://vim.fandom.com/wiki/Autoselect_the_right_compiler_using_the_filetype
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

""" Configuration for C#
""" Partly taken and adapted from https://github.com/OmniSharp/omnisharp-vim

" autocmd CursorHold *.cs OmniSharpTypeLookup
" autocmd FileType cs setlocal makeprg=dotnet\ build
" autocmd Filetype cs nmap <silent><buffer> gr             :OmniSharpFindUsages<CR>
" autocmd FileType cs nmap <silent><buffer> <C-]>          :OmniSharpGotoDefinition<CR>
" autocmd FileType cs nnoremap <silent><buffer> K          :OmniSharpDocumentation<CR>
" autocmd FileType cs nmap <buffer>         <Leader>rn     :OmniSharpRename<CR>
" autocmd FileType cs nmap <silent><buffer> ,s             :OmniSharpSignatureHelp<CR>
" 
autocmd FileType python setlocal noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType php setlocal noexpandtab shiftwidth=4 softtabstop=4

"autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
"autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
"autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
"autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
"autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
"autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
"autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)

setlocal signcolumn=yes  "prevent text shifting with lsp errors

" Configuration of asynccomplete-ezfilter Plugin
" Fuzzy match
let g:asyncomplete_preprocessor =
  \ [function('asyncomplete#preprocessor#ezfilter#filter')]

let g:asyncomplete#preprocessor#ezfilter#config = {}
let g:asyncomplete#preprocessor#ezfilter#config['*'] =
  \ {ctx, items -> ctx.osa_filter(items, 1)}

" Reimport from removed support in rafi/vim-config
if dein#tap('vim-altr')
	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)
endif
