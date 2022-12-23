call plug#begin()

" syntax-related plugins (highlighters, checkers, etc.)
Plug 'vim-syntastic/syntastic'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Golang development plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" status line plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" terraform-related plugins
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

" git tools and helpers
Plug 'mhinz/vim-signify' " inplace diff
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch' " get current git branch name

" system helperes
Plug 'christoomey/vim-system-copy'

" Filesystem exploration
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-lua/plenary.nvim' " telescope requirements
Plug 'vim-ctrlspace/vim-ctrlspace'

" quick edits and cuts
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " comment and uncomment via gcc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'inkarkat/vim-ReplaceWithRegister'

" autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"color themes
Plug 'chiendo97/intellij.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
