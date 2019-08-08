let g:python3_host_prog = '/usr/local/bin/python3'

"plug=$HOME/.local/share/nvim/site/pack/github/start; mkdir -p $plug; cd $plug
"git clone https://github.com/neoclide/coc.nvim
"git clone https://github.com/honza/vim-snippets

set background=dark
set number
set cmdwinheight=18
set smartcase
set ignorecase

nmap <silent> [b :bprevious<CR>
nmap <silent> ]b :bnext<CR>
nmap <silent> <C-l> :nohlsearch<CR>
nmap <silent> <space>d :lcd %:p:h<CR>
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

nmap <space>/ :CocList grep<space>
nmap <silent> <space>g :exe 'CocList grep '.expand('<cword>')<CR>
nmap <silent> <space>a :CocList diagnostics<CR>
nmap <silent> <space>p :CocList files<CR>
nmap <silent> <space>b :CocList buffers<CR>
nmap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nmap <silent> <space>y :CocList -A --normal yank<cr>
