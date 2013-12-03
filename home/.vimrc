"
" VIM rc file of Sebastian Pleschko
" Heavily inspired by spf13 and vim casts
"
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let mapleader = ","

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Special Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'spf13/PIV'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'editorconfig-vim'
Bundle 'groenewege/vim-less'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'nono/vim-handlebars'
Bundle 'Solarized'
Bundle 'jacekd/vim-iawriter'
Bundle 'markabe/vim-jira-open'
Bundle 'matchit.zip'

" General settings
set history=1000
set hidden
set backup
if has('persistent_undo')
    set undofile
    set undodir=~/.vimundo
    set undolevels=1000
    set undoreload=10000
endif

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
endif
set wildmenu
set wildmode=list:longest,full 
set foldenable

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Statusline settings
set laststatus=2   " Always show the statusline

" NERDTree toggle
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Tagbar toggle
nnoremap <leader>t :TagbarToggle<CR>

" Tabs and stuff
set nowrap
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set comments=s1:/**,mb:*,ex:*/,s1:/*,mb:*,ex:*/
set formatoptions+=ro
autocmd FileType php,javascript,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType javascript,html setlocal shiftwidth=2 tabstop=2 softtabstop=2 smarttab smartindent
" Fast Tabs
map <S-H> gT
map <S-L> gt

" Turn off the annoying bell
set vb

" Serch highlighting
set hlsearch
nnoremap <leader>/ :set hlsearch! hlsearch?<CR>
set incsearch
set showmatch

" Current line highlighting
set cursorline

" Fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" WD in current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" Edit mode mappings from vimcasts
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ow :e %%
map <leader>os :sp %%
map <leader>ov :vsp %%
map <leader>ot :tabe %%

" Functions
" Strip whitespace {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Change directory for swap files
set directory=~/.vimswap
set backupdir=~/.vimbackup
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Powerline Symbols
let g:Powerline_symbols = 'fancy'

" Ultisnips triggers
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:snippet_author = "Sebastian Pleschko <sebastian.pleschko@antevorte.org>"

" Keybinding for foldlevels

nnoremap <leader>f0 :set foldlevel=0<CR>
nnoremap <leader>f1 :set foldlevel=1<CR>
nnoremap <leader>f2 :set foldlevel=2<CR>
nnoremap <leader>f3 :set foldlevel=3<CR>
nnoremap <leader>f4 :set foldlevel=4<CR>
nnoremap <leader>f5 :set foldlevel=5<CR>

" Save file as root 
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Next window
nnoremap ]w <C-w>w
nnoremap [w <C-w>W

" Syntastic
let g:syntastic_always_populate_loc_list=1
" Getter/setter macro
let @g='^f$lyw]}O    public function 0crmigetA(){    return $this->0;}public function 0crmisetA($0){    $this->0 = $0;}'

" Save mapping
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-[>:w<CR>i

filetype off
filetype plugin indent off
set runtimepath+=/usr/local/opt/go/vim
filetype plugin indent on
syntax on
" Jira plugin
let g:jira_browse_url = 'http://jira.antevortenet.de/browse/'
