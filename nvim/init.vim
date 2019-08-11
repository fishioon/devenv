let g:python3_host_prog = '/usr/local/bin/python3'

"plug=$HOME/.local/share/nvim/site/pack/github/start; mkdir -p $plug; cd $plug
"git clone https://github.com/neoclide/coc.nvim
"git clone https://github.com/honza/vim-snippets

set background=dark
set number
set cmdwinheight=18
set smartcase
set ignorecase

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <C-l> :nohlsearch<CR>
nnoremap <silent> <space>d :lcd %:p:h<CR>
"autocmd FileType html,javascript,proto,yaml,yml,pac,sh,zsh setlocal ts=2 sts=2 sw=2

"========= coc
vnoremap <C-j> <Plug>(coc-snippets-select)
inoremap <C-j> <Plug>(coc-snippets-expand-jump)

nnoremap <silent> [c :call CocActionAsync('diagnosticPrevious')<CR>
nnoremap <silent> ]c :call CocActionAsync('diagnosticNext')<CR>
nnoremap <silent> <space>j :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <space>f :call CocAction('jumpReferences')<CR>
nnoremap <silent> <space>r :call CocActionAsync('rename')<CR>
nnoremap <silent> <space>k :call CocAction('format')<CR>
nnoremap <silent> <space>h :call CocAction('doHover')<CR>
command! OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

nnoremap <space>/ :CocList grep<space>
nnoremap <silent> <space>g :exe 'CocList grep '.expand('<cword>')<CR>
nnoremap <silent> <space>a :CocList diagnostics<CR>
nnoremap <silent> <space>p :CocList files<CR>
nnoremap <silent> <space>b :CocList buffers<CR>
nnoremap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <space>y :CocList -A --normal yank<cr>
