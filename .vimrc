"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif


if has('nvim')
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
else
  let vimplug_exists=expand('~/.vim/autoload/plug.vim')

  if !filereadable(vimplug_exists)
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
  endif

  " Required:
  call plug#begin(expand('~/.vim/plugged'))
endif


"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/CSApprox'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'

Plug 'junegunn/limelight.vim'
" {{{
let g:limelight_default_coefficient = 0.7
let g:limelight_conceal_ctermfg = 238
" nmap <Leader> l :Limelight!!<CR>
" }}}

Plug 'junegunn/goyo.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
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
Plug 'mxw/vim-jsx'
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
Plug 'numirias/semshi'
""*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to ,
"let mapleader=','

"" Enable hidden buffers
" set hidden // not sure if this is good or bad

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

if has('nvim')
  set inccommand=nosplit
endif

set showmatch

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/bash
set omnifunc=syntaxcomplete#Complete

let g:ruby_host_prog = 'rvm default do neovim-ruby-host'

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

set background=dark

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  colorscheme gruvbox
endif

set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif

" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE


"" Disable the blinking cursor.
set scrolloff=10

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

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
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
nnoremap <Leader>o :.Gbrowse<CR>


"" fzf
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ''
noremap <leader>b :Buffers<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>gf :GFiles?<CR>
noremap <leader><S-f> :Files<CR>
noremap <leader>t :Tags<CR>
" noremap <leader>bt :BTags<CR>
noremap <leader>' :Marks<CR>
nnoremap <leader>] :call fzf#vim#tags("'".expand('<cword>'))<cr><space>
noremap <leader>a :Ag <C-R><C-W><CR>
noremap <leader>s :Snippets<CR>

autocmd VimEnter * command! -nargs=* -bang Agr call fzf#vim#ag_raw(<q-args>, <bang>0)


" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" vim-airline
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1

"" ultisnips
let g:UltiSnipsExpandTrigger = "<leader>s"

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

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

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

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
autocmd FileType cpp,python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype scala,java,ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html,javascript,javascript.jsx setlocal tabstop=4 shiftwidth=4 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

function! LoadMainNodeModule(fname)
  let nodeModules = "./node_modules/"
  let packageJsonPath = nodeModules . a:fname . "/package.json"

  if filereadable(packageJsonPath)
    let json = json_decode(join(readfile(packageJsonPath)))
    return nodeModules . a:fname . "/" . get(json, 'main', 'index.js')
  else
    return nodeModules . a:fname
  endif
endfunction

autocmd Filetype javascript,javascript.jsx
      \ setlocal path=.,src |
      \ setlocal suffixesadd=.js,.jsx |
      \ setlocal isfname+=@-@ |
      \ setlocal includeexpr=LoadMainNodeModule(v:fname)

autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

set tags^=./.git/tags;

" rvm_ctags ruby
autocmd FileType ruby
      \ let &tags .= "," . $MY_RUBY_HOME . "/lib/tags" |
      \ let &path .= "," . $MY_RUBY_HOME . "/lib"

" elixir deps tags
autocmd FileType elixir
      \ let &tags .= ",deps/tags"

"*****************************************************************************
" LSP
"*****************************************************************************
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

nvim_lsp.pyright.setup { on_attach = on_attach }
EOF

"*****************************************************************************
" neomake linting
"*****************************************************************************
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_virtualtext_current_error=0
