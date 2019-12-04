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
let g:coc_global_extensions = ['coc-snippets','coc-lists','coc-yank','coc-git', 'coc-json', 'coc-tsserver']
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
nnoremap <silent> [c :call CocActionAsync('diagnosticPrevious')<CR>
nnoremap <silent> ]c :call CocActionAsync('diagnosticNext')<CR>
nnoremap <silent> <space>j :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <space>f :call CocAction('jumpReferences')<CR>
nnoremap <silent> <space>k :call CocAction('format')<CR>
nnoremap <silent> <space>ei :call CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <space>er :call CocActionAsync('rename')<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <space>/ :CocList --auto-preview grep<space>
nnoremap <silent> <space>a :CocList diagnostics<CR>
nnoremap <silent> <space>b :CocList buffers<CR>
nnoremap <silent> <space>l :CocList files<CR>
nnoremap <silent> <space>y :CocList -A --normal yank<cr>
nnoremap <silent> <space>g :exe 'CocList --auto-preview grep '.expand('<cword>')<CR>
nnoremap <silent> <space>w :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
