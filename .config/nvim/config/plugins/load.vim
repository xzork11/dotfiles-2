source ~/.config/nvim/config/plugins/polyglot.vim

call plug#begin('~/.local/share/nvim/plugins')

Plug 'norcalli/nvim-colorizer.lua'								" Highlight colors
Plug 'tomasiser/vim-code-dark' 										" VS Code's dark theme
Plug 'sheerun/vim-polyglot'												" Better syntax highlighting
Plug 'vimwiki/vimwiki'														" VimWiki
Plug 'vim-airline/vim-airline'										" Airline status bar
Plug 'lambdalisue/nerdfont.vim'										" NerdFonts
Plug 'tpope/vim-surround'													" Manipulate brackets, quotes etc.
Plug 'ryanoasis/vim-devicons'											" Add Devicons
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" COC Completion Love
Plug 'mattn/calendar-vim'													" Calender Plugin can be used with vimwiki
Plug 'tjdevries/coc-zsh'													" CoC Zsh plugin
Plug 'lervag/vimtex'															" Completions and syntax for Latex
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-sleuth'														" Indentation Detector
Plug 'tpope/vim-repeat'														" So that we can repeat some plugins

call plug#end()

colorscheme codedark 	" set colorscheme

source ~/.config/nvim/config/plugins/colorizer.vim
source ~/.config/nvim/config/plugins/vimwiki.vim
source ~/.config/nvim/config/plugins/airline.vim
source ~/.config/nvim/config/plugins/markdownpreview.vim
