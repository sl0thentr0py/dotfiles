"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate' "TODO neel treesitter
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'junegunn/limelight.vim'
" {{{
let g:limelight_default_coefficient = 0.7
let g:limelight_conceal_ctermfg = 238
" nmap <Leader> l :Limelight!!<CR>
" }}}

Plug 'junegunn/goyo.vim'

Plug 'chrisbra/csv.vim'

"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Color
Plug 'ap/vim-css-color'

"" Snippets
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'alexaandru/nvim-lspupdate'

" linting
Plug 'neomake/neomake'

" c
"Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" html
"" HTML Bundle
"Plug 'hail2u/vim-css3-syntax'
"Plug 'gorodinskiy/vim-coloresque'
"Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'moll/vim-node'

"ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'danchoi/ri.vim'

"scala
Plug 'derekwyatt/vim-scala'

"rust
Plug 'rust-lang/rust.vim'

"swift
Plug 'keith/swift.vim'

"elixir
Plug 'elixir-editors/vim-elixir'

"ansible
Plug 'pearofducks/ansible-vim'

"nginx
Plug 'chr4/nginx.vim'

"R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

"Python
Plug 'numirias/semshi' "treesitter
""*****************************************************************************
"*****************************************************************************

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to ,
"let mapleader=','

"" Searching
set ignorecase
set smartcase

set inccommand=nosplit
set showmatch

"" Directories for swp files
set nobackup
set noswapfile

set omnifunc=syntaxcomplete#Complete

let g:ruby_host_prog = 'rvm default do neovim-ruby-host'

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set number
colorscheme gruvbox

set mouse=a

set scrolloff=10

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" wildmode
set wildmenu
set wildmode=longest:full
set wildignore+=*.a,*.o,*.hi
set wildignore+=*.pdf,*.gz,*.aux,*.out,*.nav,*.snm,*.vrb
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have these shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"*****************************************************************************
"" Plugins
"*****************************************************************************

"" vim-fugitive

noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>o :.GBrowse<CR>


"" fzf " TODO neel telescope
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = '' 
noremap <leader>b :Buffers<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>gf :GFiles?<CR>
noremap <leader><S-f> :Files<CR>
noremap <leader>' :Marks<CR>
noremap <leader>a :Ag <C-R><C-W><CR>
noremap <leader>s :Snippets<CR>

autocmd VimEnter * command! -nargs=* -bang Agr call fzf#vim#ag_raw(<q-args>, <bang>0)

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"*****************************************************************************
"" Language configs
"*****************************************************************************

" indent
autocmd FileType cpp,python,html,javascript,javascript.jsx setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType c,scala,java,ruby setlocal tabstop=2 shiftwidth=2 expandtab

let g:python3_host_prog = expand('~/.pyenv/versions/neovim-venv/bin/python')

"*****************************************************************************
" lua
"*****************************************************************************
lua require('lsp')
lua require('line')

"*****************************************************************************
" neomake linting
"*****************************************************************************
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_virtualtext_current_error=0
