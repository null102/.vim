" ==========================
"       NERDTree
" ==========================
" 映射 Ctrl+n 打开/关闭文件树
map <C-n> :NERDTreeToggle<CR>

" 关闭 Vim 时若只剩文件树则自动退出
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" 显示文件图标（需安装 NERDTree-git-plugin 和 nerd-fonts）
let g:NERDTreeGitStatusUseNerdFonts = 1

autocmd VimEnter * NERDTree  " 强制启动 NERDTree
autocmd VimEnter * wincmd p  " 将焦点移至文件窗口
" ==========================
"       orgmode
" ==========================
" 自动识别 .org 文件并启用语法
autocmd FileType org setlocal syntax=org

" 设置快捷键前缀（类似 Emacs 的 C-c）
let g:org_leader = ','
" ==========================
"        PLUG
" ==========================

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'jceb/vim-orgmode'       " Org Mode 核心功能
Plug 'tpope/vim-speeddating'  " 日期操作依赖
call plug#end()

" ==========================
"    Basic Settings
" ==========================

set viminfofile=~/.vim/vnminfo
set nocompatible          " Use Vim defaults instead of vi compatibility
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" 自动保存/恢复视图（光标位置、折叠状态等）
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" ==========================
"    UI Enhancements
" ==========================

set number                " Show line numbers
set showcmd               " Show (partial) command in status line
set showmode              " Show current mode
set ruler                 " Show cursor position
set wildmenu              " Enhanced command-line completion
set lazyredraw            " Improve performance for macros etc.
set visualbell            " Disable error beeps

" ==========================
"    Indentation & Tabs
" ==========================

set tabstop=4             " Number of spaces per tab
set shiftwidth=4          " Spaces for autoindent
set softtabstop=4         " Spaces when hitting <Tab>
set expandtab             " Use spaces instead of tabs
set smartindent           " Smart auto-indenting
set autoindent            " Copy indent from current line when starting new one

" ==========================
"    Searching
" ==========================

set ignorecase            " Case-insensitive searching...
set smartcase             " ...unless capital letters are used
set incsearch             " Show search matches as you type
set hlsearch              " Highlight search matches
set noerrorbells          " Disable error bells

" ==========================
"    File Handling
" ==========================

set autoread              " Auto-reload files changed outside of vim
set nobackup              " Don't create backup files
set nowritebackup         " Don't keep backup before overwriting
set noswapfile            " No swap files

" ==========================
"    Clipboard & Mouse
" ==========================

set mouse=a               " Enable mouse in all modes
set clipboard=unnamedplus " Use system clipboard

" ==========================
"    Scrolling & Navigation
" ==========================

set scrolloff=8           " Keep 8 lines above/below the cursor
set sidescrolloff=8
set wrap                  " Enable line wrapping
set linebreak             " Wrap at word boundaries

" ==========================
"    Status Line
" ==========================

set laststatus=2          " Always show status line
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ 

" ==========================
"    Misc
" ==========================

set timeoutlen=500        " Faster command timeout
set updatetime=300        " Faster updates for CursorHold etc.
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection and indentation

" ==========================
"    Keymaps
" ==========================

nnoremap <SPACE> :        " Space as command leader (optional)
nnoremap <C-s> :w<CR>     " Save with Ctrl+S
inoremap <C-s> <Esc>:w<CR>li

" Quick escape from insert mode
inoremap jj <Esc>

" Disable arrow keys to encourage hjkl
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>

" ==========================
"    Custom Commands (Optional)
" ==========================

" Remove trailing whitespace
command! Trim :%s/\s\+$//e

