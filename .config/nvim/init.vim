"     " plugin section
"
"     " Specify a directory for plugins
"     " - For Neovim: ~/.local/share/nvim/plugged
"     call plug#begin('~/.local/share/nvim/plugged')
"
"     Plug 'digitalrounin/vim-yaml-folds'
"     Plug 'https://github.com/vim-perl/vim-perl', { 'for':
"     'perl', 'do': 'make clean carp dancer
"     highlight-all-pragmas moose test-more try-tiny' }
"
"     " Initialize plugin system
"     call plug#end()

set softtabstop=4
set shiftwidth=4
set expandtab
set nu

set mouse=a

syntax enable
set termguicolors
colorscheme hemisu

" Familiar tab completion
set wildmenu
set wildmode=longest:full,full

" Define statusline format
set statusline=
set statusline+=%2*\[%n]
"buffernr
set statusline+=%2*\ %<%F\ 
"File+path
set statusline+=%2*\ %y\ 
"FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}
"Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\ 
"Encoding2
set statusline+=%4*\ %{&ff}\ 
"FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\ 
"Rownumber/total (%)
set statusline+=%9*\ col:%03c\ 
"Colnr
set statusline+=%0*\ %m%r%w\ %P\ \ 
"Modified? Readonly? Top/bot.

" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
hi statusline ctermbg=white ctermfg=red
if version >= 700
  au InsertEnter * hi statusline term=reverse ctermbg=157 guibg=#BBFFAA
  au InsertLeave * hi statusline ctermfg=3 ctermbg=0
endif

