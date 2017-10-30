call plug#begin()

"statusbar
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

"auto completion
Plug 'Shougo/deoplete.nvim'

"Plug 'zchee/deoplete-clang'

Plug 'zchee/deoplete-jedi'

Plug 'autozimu/LanguageClient-neovim'

"include completion
Plug 'Shougo/neoinclude.vim'

"echodoc
Plug 'Shougo/echodoc.vim'

"file viwer
Plug 'scrooloose/nerdtree'

"fuzzy finder
Plug 'cloudhead/neovim-fuzzy'

"delete buffer without closing the window
Plug 'qpkorr/vim-bufkill'

"git
Plug 'tpope/vim-fugitive'

"improved highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

"improved session management
Plug 'xolox/vim-misc'

Plug 'xolox/vim-session'

"Theme
Plug 'freeo/vim-kalisi'

Plug 'tomasr/molokai'

"Gutentags
Plug 'ludovicchabant/vim-gutentags'

"Clang format
Plug 'rhysd/vim-clang-format'

"Commenting
Plug 'scrooloose/nerdcommenter'

"Cmake integration
Plug 'vhdirk/vim-cmake'

"Neoterm
Plug 'kassio/neoterm'

call plug#end()

"show line numbers
set number

"show relative numbers
set relativenumber

"tab settings
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smartindent
set cindent
set cinoptions=(0,u0,U0

"activate true color mode
set termguicolors

"highlight column 80
set colorcolumn=80

"colorscheme kalisi
set background=dark
colorscheme molokai

" enable mouse in all modes exept insert mode
set mouse=nvchr

"disable left mouse click in normal mode
nmap <LeftMouse> <nop>

let mapleader=','

"switch z and y on german keyboard
noremap <C-z> <C-y>

"window functions

"create window and open file
noremap <silent><Leader>s <C-W>s<C-W>j:FuzzyOpen<CR>
noremap <silent><Leader>v <C-W>v<C-W>l:FuzzyOpen<CR>

"resize window
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap _ <C-W><
nnoremap * <C-W>>

"fast window switching
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"open terminal
"noremap <Leader>t <C-W>v<C-W>l:terminal<CR>
let g:neoterm_position='vertical'
noremap <silent><Leader>t :Ttoggle<CR>
"fast terminal exit
tnoremap <ESC> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

"terminal colors (tango scheme)
let g:terminal_color_0 = '#0000'
let g:terminal_color_1 = '#CC0000'
let g:terminal_color_2 = '#4E9A06'
let g:terminal_color_3 = '#C4A000'
let g:terminal_color_4 = '#3465A4'
let g:terminal_color_5 = '#75507B'
let g:terminal_color_6 = '#06989A'
let g:terminal_color_7 = '#D3D7CF'
let g:terminal_color_8 = '#555753'
let g:terminal_color_9 = '#EF2929'
let g:terminal_color_10 = '#8AE234'
let g:terminal_color_11 = ' #FCE94F'
let g:terminal_color_12 = '#729FCF'
let g:terminal_color_13 = '#AD7FA8'
let g:terminal_color_14 = '#34E2E2'
let g:terminal_color_15 = '#EEEEEC'

"clang-format
augroup clangformat
	autocmd!
	autocmd FileType c,cpp,objc noremap <C-K> :ClangFormat<cr>
	autocmd FileType c,cpp,objc ClangFormatAutoEnable
augroup END

let g:clang_format#detect_style_file=1
let g:clang_format#style_options = {
			                        \"BasedOnStyle": "Google",
									\"AccessModifierOffset": -4,
									\"BreakBeforeBraces": "Linux",
									\"IndentWidth": 4,
									\"TabWidth": 4,
									\"AllowShortBlocksOnASingleLine": "false",
									\"AllowShortFunctionsOnASingleLine": "Inline",
									\"UseTab": "ForIndentation" }
"NerdCree
map <silent><C-n> :NERDTreeToggle<CR>

"airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"auto completion
set completeopt=menuone
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
inoremap<silent><expr><C-Space> deoplete#mappings#manual_complete()

"deoplete-clang
"let g:deoplete#sources#clang#sort_algo = 'priority'
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"echodoc
set noshowmode "disable mode indactor in command line
set completeopt-=preview "disable preview window
let g:echodoc_enable_at_startup = 1


"neovim-fuzzy
noremap <silent><C-p> :FuzzyOpen<CR>

"vim-session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_persist_font = 0
let g:session_persist_colors = 0

"language server
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ }
let g:LanguageClient_autoStart = 1
