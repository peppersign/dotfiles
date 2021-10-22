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
set scrolloff=999

" Plugin manager
call plug#begin(expand('~/.vim/plugged'))
"Plug 'sjl/badwolf'
"Plug 'ghifarit53/tokyonight-vim'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
"Plug 'sickill/vim-monokai'
"Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
"Plug 'psliwka/vim-smoothie'
Plug 'sainnhe/gruvbox-material'
Plug 'dracula/vim'
call plug#end()


" Colorscheme
"let g:gruvbox_italic = 1
"let g:gruvbox_italicize_comments = 1
"colorscheme gruvbox

let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material

" Shortcuts
nnoremap zz :w<cr>
imap <C-BS> <C-W>

" Nerdtree 
autocmd VimEnter * NERDTree | wincmd p
nnoremap <C-t> :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Vim smoothie
"let g:smoothie_experimental_mappings = 1
