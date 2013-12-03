set guifont=Source\ Code\ Pro\ for\ Powerline:h16
set background=dark
colorscheme solarized
" Powerline via pip 
if has('gui')
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
endif
