syntax on
filetype plugin on
set encoding=UTF-8
set nocompatible
set title
set backspace=indent,eol,start
set hidden
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
colorscheme OceanicNext
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight LineNrAbove ctermbg=NONE guibg=NONE
highlight LineNrBelove ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
set fillchars+=vert:\ 
highlight VertSplit cterm=bold ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
"
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
let g:airline_theme='oceanicnext'
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
autocmd CursorHold * silent call CocActionAsync('highlight')
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" coc go to mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
