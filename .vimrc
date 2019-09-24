" ---------------------------------------------------------------------
" First install vim-plug as it says here:
" https://github.com/junegunn/vim-plug#installation
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
" Install plugins with:
" :PlugInstall
call plug#begin('~/.vim/plugplugplug')

" Cool bottom line
Plug 'itchyny/lightline.vim'

" NERD file list
Plug 'scrooloose/nerdtree'

" NERD tabs
Plug 'jistr/vim-nerdtree-tabs'

" fzf Fuzzy find install and use in vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code analysis
Plug 'w0rp/ale'

" Completion
Plug 'valloric/youcompleteme'

" Surround selected text
" Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Comment out code
Plug 'tpope/vim-commentary'

" Show indentation
Plug 'nathanaelkane/vim-indent-guides'

" Initialize plugin system
call plug#end()
" ---------------------------------------------------------------------

" Pretty colors
colorscheme ron

" When lazy use mouse
set mouse=a

" NERD hot key: Ctrl O
map <C-o> :NERDTreeTabsToggle<CR>

" NERD open files in new tab with Enter key
" let NERDTreeMapOpenInTab='<ENTER>'

" NERD Show invisible files in
let NERDTreeShowHidden=1

" NERD width
let g:NERDTreeWinSize=40

" NerdTree colors
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('pug', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('html', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('md', 'magenta', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('less', 'brown', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'brown', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('jsx', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('purs', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('elm', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('Dockerfile', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')

" For lightline to display correctly
set laststatus=2

" fzf search filenames to Ctrl P
map <C-p> :Files<CR>

" fzf search documents to Ctrl F
map <C-f> :Ag<CR>

" Set to UTF8 for dev icons
set encoding=UTF-8

" jk to go to Normal from Insert
inoremap jk <esc>

" Bracket completion
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
inoremap [ []<Esc>i

" Handle weird delete button
fixdel

" Show line numbers
set number
set relativenumber

" Highlight search results
set hlsearch

" Autoindent
" set ai
filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=white

" Tabs shortcuts
nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Make our Leader key in vim the space bar
let mapleader = "\<Space>"

" Save with Leader w
nnoremap <Leader>w :w<CR>

" Quit with Leader q
nnoremap <Leader>q :qa<CR>

" Close tab with Leader c
nnoremap <Leader>c :q<CR>
