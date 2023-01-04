set number
unmap Y

" Set spell check highlighting
augroup my_colours
  autocmd!
  autocmd ColorScheme * hi SpellBad cterm=reverse guifg=LightRed
augroup END

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

lua << EOF
require('refactoring').setup({})
require('telescope').load_extension("refactoring")
EOF

lua << EOF
require("lsp-inlayhints").setup()

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})
EOF

" lua << EOF
" require("nvim-semantic-tokens").setup {
"   preset = "default",
"   -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or
"   -- function with the signature: highlight_token(ctx, token, highlight) where
"   --        ctx (as defined in :h lsp-handler)
"   --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
"   --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
"   highlighters = { require 'nvim-semantic-tokens.table-highlighter'}
" }
" EOF

" if &filetype == "cpp" || &filetype == "cuda" || &filetype == "c"
"   autocmd BufEnter,TextChanged <buffer> lua require 'vim.lsp.buf'.semantic_tokens_full()
" endif

" Set compiler: https://vim.fandom.com/wiki/Autoselect_the_right_compiler_using_the_filetype
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

autocmd FileType python setlocal noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType php setlocal noexpandtab shiftwidth=4 softtabstop=4
" enable comment spell checking through lewis6991/spellsitter.nvim
autocmd FileType cpp setlocal spell
autocmd FileType dart lua require'lspconfig'.dartls.setup{}

setlocal signcolumn=yes  "prevent text shifting with lsp errors

" Reimport from removed support in rafi/vim-config
if dein#tap('vim-altr')
       nmap <leader>n  <Plug>(altr-forward)
       nmap <leader>N  <Plug>(altr-back)
endif


" Configuration of asynccomplete-ezfilter Plugin
" Fuzzy match
let g:asyncomplete_preprocessor =
  \ [function('asyncomplete#preprocessor#ezfilter#filter')]

let g:asyncomplete#preprocessor#ezfilter#config = {}
let g:asyncomplete#preprocessor#ezfilter#config['*'] =
  \ {ctx, items -> ctx.osa_filter(items, 1)}

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --encode utf-8 --format - 2>/dev/null
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  " exe "set ft=" . l:origft
  " AS: force xml filteype
  exe "set ft=xml"
endfunction

function! DoCompactXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --encode utf-8 --noblanks - 2>/dev/null
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  1d
  s/<PrettyXML>//g
  s/<\/PrettyXML>//g
  "$d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  " exe "set ft=" . l:origft
  " AS: force xml filteype
  exe "set ft=xml"
endfunction

command! PrettyXML call DoPrettyXML()
command! CompactXML call DoCompactXML()
