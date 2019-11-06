set background=dark
set number
set cmdwinheight=18
set smartcase
set ignorecase

tnoremap <C-[> <C-\><C-n>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <silent> <space>d :lcd %:p:h<CR>

autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
"autocmd FileType json setlocal ts=4 sts=4 sw=4

"========= coc
let g:coc_global_extensions = ['coc-snippets','coc-lists','coc-yank','coc-git', 'coc-json']
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

nnoremap <space>/ :CocList --auto-preview grep<space>
nnoremap <silent> <space>a :CocList diagnostics<CR>
nnoremap <silent> <space>p :CocList files<CR>
nnoremap <silent> <space>b :CocList buffers<CR>
nnoremap <silent> <space>y :CocList -A --normal yank<cr>
nnoremap <silent> <space>g :exe 'CocList grep '.expand('<cword>')<CR>
nnoremap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
