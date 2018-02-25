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
set statusline+=%0*\[%n]
"buffernr
set statusline+=%0*\ %<%F\ 
"File+path
set statusline+=%0*\ %y\ 
"FileType
set statusline+=%0*\ %{''.(&fenc!=''?&fenc:&enc).''}
"Encoding
set statusline+=%0*\ %{(&bomb?\",BOM\":\"\")}\ 
"Encoding2
set statusline+=%0*\ %{&ff}\ 
"FileFormat (dos/unix..)
set statusline+=%9*\ %=\ %0*row:%l/%L\ (%03p%%)\ 
"Rownumber/total (%)
set statusline+=%0*\ col:%03c\ 
"Colnr
set statusline+=%0*\ %m%r%w\ %P\ \ 
"Modified? Readonly? Top/bot.

" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
hi statusline cterm=bold ctermfg=233 ctermbg=255 gui=bold guifg=#111111 guibg=#EEEEEE
if version >= 700
  au InsertEnter * hi statusline ctermbg=195 guibg=#CBE4EE
  au InsertLeave * hi statusline cterm=bold ctermfg=233 ctermbg=255 gui=bold guifg=#111111 guibg=#EEEEEE
endif

