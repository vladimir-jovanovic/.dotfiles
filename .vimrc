syntax on
filetype plugin on
set encoding=UTF-8
set nocompatible
set title
set backspace=indent,eol,start
set autoread 
set ignorecase
set smartcase
set hlsearch
set modelines=0
set wildmenu
set wildmode=longest:full
set number
set relativenumber
set tabstop=4 softtabstop=-1 shiftwidth=0 expandtab 
set autoindent
set lbr
set tw=500
set nowrap
set timeoutlen=1000 ttimeoutlen=0
set updatetime=300
set cmdheight=2
set splitbelow
set splitright

set termguicolors

set background=light
"let g:one_allow_italics = 1
colorscheme vslight
"highlight Normal ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight LineNrAbove ctermbg=NONE guibg=NONE
highlight LineNrBelove ctermbg=NONE guibg=NONE
highlight SignColumn ctermfg=NONE guifg=NONE ctermfg=NONE guifg=NONE
highlight SignColumn ctermfg=NONE guifg=NONE ctermfg=NONE guifg=NONE
set fillchars+=vert:\ 
highlight VertSplit cterm=bold ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi CursorLine cterm=none
" remap cursor movements
noremap l h
noremap ; l
noremap h ;

" disable arrows
map <Up> <NOP>
map <Down> <NOP>
map <Right> <NOP>
map <Left> <NOP>

inoremap jj <Esc>

" window change
nnoremap <C-W>l <C-W><C-H>
nnoremap <C-W>; <C-W><C-L>

" buffer manipulations
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader><Tab> :bn<CR>
nnoremap <Leader><S-Tab> :bp<CR>
nnoremap <Leader>q :bp<cr>:bd #<cr>
nnoremap <Leader>w :w<cr>


" airline configuration
let g:airline_theme='vslight'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" devicons configuration
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" NERDTree configuration
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeIgnore=['node_modules']
let g:NERDTreeAutoCenter=0
noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" coc autocomplete mappings
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Plug>CustomCocCR pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc highlight symbol under cursor on CursorHold
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" coc go to mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <C-a>.  <Plug>(coc-codeaction)

" closetag configuration
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

let g:coc_global_extensions = [
      \'coc-html', 
      \'coc-css', 
      \'coc-json', 
      \'coc-tsserver', 
      \'coc-angular', 
      \'coc-emmet', 
      \'coc-highlight',
      \'coc-eslint'
      \]

map <F10> :sh<CR>

filetype plugin indent on

autocmd FileType python map <buffer> <F5> :w<CR>:exec '! clear; python3 -i' shellescape(@%, 1)<CR><CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '! clear; python3 -i' shellescape(@%, 1)<CR>

autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set textwidth=80
autocmd FileType python set smartindent
autocmd FileType python set shiftwidth=4

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

autocmd BufNewFile,BufRead *.cshtml set filetype=html
autocmd BufNewFile,BufRead *.razor set filetype=html

let g:ale_set_quickfix = 1
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
autocmd FileType cs nmap <silent> <buffer> <C-a>. <Plug>(omnisharp_code_actions)
autocmd FileType cshtml nmap <silent> <buffer> <C-a>. <Plug>(omnisharp_code_actions)
autocmd FileType cs nmap <silent> <buffer> <Leader>f <Plug>(omnisharp_code_format)
autocmd FileType cshtml vmap <silent> <buffer> <Leader>f <Plug>(omnisharp_code_format)
autocmd FileType cs nmap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)

autocmd FileType tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0
