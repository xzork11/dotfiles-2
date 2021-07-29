source ~/.config/nvim/config/plugins/polyglot.vim

call plug#begin('~/.local/share/nvim/plugins')

" Highlight colors
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
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
Plug 'Yggdroot/indentLine'												" Show indentation

" Preview for HTML
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Inbuilt LSP
" Plug 'neovim/nvim-lspconfig'

" Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme codedark 	" set colorscheme

source ~/.config/nvim/config/plugins/colorizer.vim
source ~/.config/nvim/config/plugins/vimwiki.vim
source ~/.config/nvim/config/plugins/airline.vim
source ~/.config/nvim/config/plugins/markdownpreview.vim
source ~/.config/nvim/config/plugins/indentLine.vim
