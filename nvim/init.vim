set background=dark
set number
set cmdwinheight=18
set smartcase
set ignorecase

"tnoremap <C-[> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <silent> <space>d :lcd %:p:h<CR>
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

"========= coc
let g:coc_global_extensions = ['coc-snippets','coc-lists','coc-yank','coc-git', 'coc-json', 'coc-tsserver']
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
nnoremap <silent> [c :call CocActionAsync('diagnosticPrevious')<CR>
nnoremap <silent> ]c :call CocActionAsync('diagnosticNext')<CR>
nnoremap <silent> <space>j :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <space>f :call CocAction('jumpReferences')<CR>
nnoremap <silent> <space>k :call CocAction('format')<CR>
nnoremap <silent> <space>h :call CocAction('doHover')<CR>
nnoremap <silent> <space>ei :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <silent> <space>er :call CocActionAsync('rename')<CR>

nnoremap <space>/ :CocList --auto-preview grep<space>
nnoremap <silent> <space>a :CocList diagnostics<CR>
nnoremap <silent> <space>b :CocList buffers<CR>
nnoremap <silent> <space>l :CocList files<CR>
nnoremap <silent> <space>y :CocList -A --normal yank<cr>
nnoremap <silent> <space>g :exe 'CocList --auto-preview grep '.expand('<cword>')<CR>
nnoremap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

command! -nargs=* T belowright split | resize 16 | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
