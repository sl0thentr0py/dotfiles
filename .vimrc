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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-characterize'
Plug 'vim-scripts/CSApprox'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
" Plug 'junegunn/limelight.vim'
" " {{{
" let g:limelight_default_coefficient = 0.7
" let g:limelight_conceal_ctermfg = 238
" nmap <Leader> l :Limelight!!<CR>
" " }}}
Plug 'junegunn/goyo.vim'

Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'

"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Color
Plug 'ap/vim-css-color'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" linting
" Plug 'w0rp/ale'

" c
"Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" html
"" HTML Bundle
"Plug 'hail2u/vim-css3-syntax'
"Plug 'gorodinskiy/vim-coloresque'
"Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
"Plug 'jelera/vim-javascript-syntax'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'

"ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'danchoi/ri.vim'

"scala
"Plug 'ensime/ensime-vim'
Plug 'derekwyatt/vim-scala'

"rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
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

set showmatch

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/bash

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
set gcr=a:blinkon0
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
"" no one is really happy until you have this shortcuts
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
"" NERDTree configuration
let g:NERDTreeChDirMode=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeNaturalSort=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" tagbar
nmap <F8> :TagbarToggle<CR>

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
noremap <leader>b :Buffers<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>gf :GFiles?<CR>
noremap <leader><S-f> :Files<CR>
noremap <leader>t :Tags<CR>
noremap <leader>' :Marks<CR>
nnoremap <leader>] :call fzf#vim#tags("'".expand('<cword>'))<cr><space>
noremap <leader>a :Ag <C-R><C-W><CR>


" The Silver Searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --nogroup\ --nocolor
endif

" syntastic
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'
"let g:syntastic_auto_loc_list=1
"let g:syntastic_aggregate_errors = 1

" Tagbar
"map <silent> <F4> :TagbarToggle<CR>
"let g:tagbar_autofocus = 1
"

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1



" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep          = '▶'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '◀'
let g:airline_right_alt_sep     = '«'
let g:airline#extensions#branch#prefix     = '➔'
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '➔'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

""""ensime
"let ensime_server_v2=1
"autocmd FileType scala,java
"            \ nnoremap <buffer> <silent> <LocalLeader>t :EnType<CR> |
"            \ nnoremap <buffer> <silent> <LocalLeader>T :EnTypeCheck<CR> |
"            \ nnoremap <buffer> <silent> <LocalLeader>g :EnDeclaration<CR> |
"            \ nnoremap <buffer> <silent> <LocalLeader>i :EnInspectType<CR> |
"            \ nnoremap <buffer> <silent> <LocalLeader>I :EnSuggestImport<CR> |
"            \ nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>

"" racer
let g:racer_cmd = "/home/neel/.cargo/bin/racer"
let g:racer_experimental_completer = 1

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

"" tagbar
" autocmd FileType * nested :call tagbar#autoopen(0)

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Source vimrc
map <leader>s :source ~/.vimrc<CR>

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
"" Lanugage configs
"*****************************************************************************

" indent
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype scala,java,ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html,javascript setlocal tabstop=4 shiftwidth=4 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

" ruby
" if executable('ripper-tags')
"   let g:tagbar_type_ruby = {
"       \ 'kinds'      : ['m:modules',
"                       \ 'c:classes',
"                       \ 'C:constants',
"                       \ 'F:singleton methods',
"                       \ 'f:methods',
"                       \ 'a:aliases'],
"       \ 'kind2scope' : { 'c' : 'class',
"                        \ 'm' : 'class' },
"       \ 'scope2kind' : { 'class' : 'c' },
"       \ 'ctagsbin'   : 'ripper-tags',
"       \ 'ctagsargs'  : ['-f', '-']
"       \ }
" endif

"*****************************************************************************
"*****************************************************************************
