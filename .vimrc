"Rules
set number
set autoindent
set laststatus=2
set cursorline
set ttymouse=sgr
set mouse=a
set wrap!


" Syntax highlight
syntax on
set bg=dark

" Tab spaces
set tabstop=4
set shiftwidth=4
set expandtab
set sidescrolloff=999
set scrolloff=999

" Plugin manager
call plug#begin(expand('~/.vim/plugged'))
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'sainnhe/gruvbox-material'
call plug#end()

let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material

" Shortcuts
nnoremap zz :w<cr>

" Nerdtree shortcuts
autocmd VimEnter * NERDTree | wincmd p
nnoremap <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
