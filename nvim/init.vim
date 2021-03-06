set background=dark
set number
set cmdwinheight=18
set smartcase
set ignorecase
set foldmethod=indent
set foldlevel=8
set scrollback=100000
"set colorcolumn=120

nnoremap <silent> <space>1 1gt
nnoremap <silent> <C-l> :nohl<CR><C-l>
command! -nargs=? Gcd silent! execute 'cd %:h | lcd `git root`'
nnoremap <silent> <space>d :Gcd<CR>
"nnoremap <silent> <space>d :lcd %:p:h<CR>

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
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

autocmd FileType c,c++,javascript,typescipt setlocal ts=2 sw=2 sts=2 expandtab
autocmd BufRead,BufNewFile * if getline(1) =~ '^{' | setfiletype json | endif

command! -nargs=* T belowright split | resize 16 | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

"========= coc
let g:coc_global_extensions = ['coc-snippets', 'coc-lists', 'coc-yank', 'coc-eslint', 'coc-git', 'coc-tsserver', 'coc-pairs']
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

nnoremap <silent> <space>rn :call CocActionAsync('rename')<CR>
nnoremap <silent> <space>m :call CocAction('format')<CR>
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>b  :<C-u>CocList buffers<CR>
nnoremap <silent> <space>f  :<C-u>CocList files<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>ls :<C-u>CocList<CR>
nnoremap <silent> <space>lc :<C-u>CocList commands<cr>
nnoremap <silent> <space>la :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>lm :<C-u>CocList marks<cr>

nnoremap <space>/ :CocList --auto-preview grep -S<space>
nnoremap <silent> <space>g :exe 'CocList --auto-preview grep '.expand('<cword>')<CR>
nnoremap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
