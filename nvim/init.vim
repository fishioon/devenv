let g:python3_host_prog = '/usr/local/bin/python3'

set background=dark
set number
set cmdwinheight=18
set smartcase
set ignorecase
set signcolumn=yes

tnoremap <C-]> <C-\><C-n>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <silent> <space>d :lcd %:p:h<CR>

"autocmd FileType html,javascript,proto,yaml,yml,pac,sh,zsh setlocal ts=2 sts=2 sw=2

"========= coc
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> [c :call CocActionAsync('diagnosticPrevious')<CR>
nmap <silent> ]c :call CocActionAsync('diagnosticNext')<CR>
nmap <silent> <space>j :call CocAction('jumpDefinition')<CR>
nmap <silent> <space>f :call CocAction('jumpReferences')<CR>
nmap <silent> <space>r :call CocActionAsync('rename')<CR>
nmap <silent> <space>k :call CocAction('format')<CR>
nmap <silent> <space>h :call CocAction('doHover')<CR>
command! OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <space>a :CocList diagnostics<CR>
nnoremap <silent> <space>p :CocList files<CR>
nnoremap <silent> <space>b :CocList buffers<CR>
nnoremap <silent> <space>y :CocList -A --normal yank<cr>
nnoremap <space>/ :CocList grep<space>
nnoremap <silent> <space>g :exe 'CocList grep '.expand('<cword>')<CR>
nnoremap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
