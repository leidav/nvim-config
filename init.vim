call plug#begin()

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

"auto completion
Plug 'Shougo/deoplete.nvim'

Plug 'scrooloose/nerdtree'

call plug#end()

"show line numbers
set number

"activate true color mode
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme  badwolf

"clang-format
map <C-C> :pyf ~/.vim/clang-format.py<cr>
imap <C-C> <c-o>:pyf ~/.vim/clang-format.py<cr>

"Nerdtree
map <Space>n :NERDTreeToggle<CR>

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"deoplete
let g:deoplete#enable_at_startup = 1
