"
" VIM rc file of Sebastian Pleschko
" Heavily inspired by spf13 and vim casts
"
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let mapleader = "\<Space>"

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" Special Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'myusuf3/numbers.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-easymotion'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-salve'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-markdown'
Plugin 'mileszs/ack.vim'
Plugin 'editorconfig-vim'
Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'
Plugin 'Solarized'
Plugin 'jacekd/vim-iawriter'
Plugin 'markabe/vim-jira-open'
Plugin 'matchit.zip'
Plugin 'joonty/vdebug.git'
Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'fatih/vim-go'
Plugin 'confluencewiki.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'wakatime/vim-wakatime'
Plugin 'pthrasher/conqueterm-vim'
Plugin 'scroloose/nerdtree'
Plugin 'JuliaLang/julia-vim'
Plugin 'kovisoft/slimv'

call vundle#end()
filetype plugin indent on
syntax on

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

"  Turn off the annoying bell
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
noremap <leader>w :w<CR>

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

" Correct go formatting
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" Syntastic
let g:syntastic_php_checkers = ['php', 'phpcs']
"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"    \ }
"
" CTRLP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Diff Options
set diffopt=filler,vertical,iwhite,icase

" Vim Productivity tips http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nmap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Go Syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
