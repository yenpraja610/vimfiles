" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged/')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'ntpeters/vim-better-whitespace'
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'sjl/clam.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'romainl/vim-qf'
Plug 'taohex/lightline-buffer'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fidian/hexmode'

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'jackiehluo/vim-material'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'yuttie/hydrangea-vim'
Plug 'joshdick/onedark.vim'
Plug 'nightsense/seabird'
Plug 'trevordmiller/nova-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'Badacadabra/vim-archery'
Plug 'dim13/smyck.vim'
Plug 'nightsense/carbonized'
Plug 'Drogglbecher/vim-moonscape'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'carlson-erik/wolfpack'

call plug#end()

" =====================================
"             General Configuration
" =====================================
if !exists('g:encoding_set') || !has('nvim')
	set encoding=utf8
	let g:encoding_set = 1
endif

" after a re-source, fix syntax matching issues
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

" ----------[ vim-filer
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'

call vimfiler#custom#profile('default', 'context', {
			\ 'safe' : 0,
			\ 'direction' : 'rightbelow',
			\ 'edit_action' : 'tabopen',
			\ })

"map <silent> <C-n> :VimFilerExplorer<CR>

" ----------[ nerdtree
let g:NERDTreeWinPos = 'right'
let g:NERDTreeQuitOnOpen = 1

map <silent> <C-n> :NERDTreeToggle<CR>
"autocmd FileType nerdtree nmap <buffer> <CR> t

" ----------[ ctrlp.vim
let g:ctrlp_cmd = 'CtrlPBuffer'

" ----------[ vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" ----------[ vim-lengthmatters
let g:lengthmatters_on_by_default = 1

call lengthmatters#highlight_link_to('TooLong')

" ----------[ vim-gitgutter
nmap <silent> <C-d> :GitGutterLineHighlightsToggle<CR>

if exists('&signcolumn')  " Vim 7.4.2201
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_diff_args = '-w' " ignore whitespace
let g:gitgutter_grep_command = 'ag'
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0

" ----------[ golden-ratio
let g:golden_ratio_autocommand = 0
let g:golden_ratio_exclude_nonmodifiable = 1

" ----------[ clam.vim
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
"let g:clam_winpos = 'vertical botright'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" ----------[ YouCompleteMe
"let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
"let g:ycm_filetype_blacklist = {
"			\ 'tagbar' : 1,
"			\ 'qf' : 1,
"			\ 'notes' : 1,
"			\ 'markdown' : 1,
"			\ 'unite' : 1,
"			\ 'text' : 1,
"			\ 'vimwiki' : 1,
"			\ 'pandoc' : 1,
"			\ 'infolog' : 1,
"			\ 'mail' : 1
"			\ }

" ----------[ lightline
let g:lightline = {
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
			\ },
			\ 'tabline': {
			\   'left': [ [ 'bufferinfo' ],
			\             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ] ],
			\   'right': [ [ 'close' ] ],
			\ },
			\ 'component_expand': {
			\   'buffercurrent': 'lightline#buffer#buffercurrent',
			\   'bufferbefore': 'lightline#buffer#bufferbefore',
			\   'bufferafter': 'lightline#buffer#bufferafter',
			\ },
			\ 'component_type': {
			\   'buffercurrent': 'tabsel',
			\   'bufferbefore': 'raw',
			\   'bufferafter': 'raw',
			\ },
			\ 'component_function': {
			\   'bufferinfo': 'lightline#buffer#bufferinfo',
			\   'gitbranch': 'fugitive#head',
			\ },
			\ 'component': {
			\   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
			\   'modified': '%{&filetype=="help"?"":&modified?"\ue0a0":&modifiable?"":"-"}',
			\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
			\ },
			\ 'component_visible_condition': {
			\   'readonly': '(&filetype!="help"&& &readonly)',
			\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
			\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
			\ },
			\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
			\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
			\ }

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 0

" Remap arrow keys for buffer switching
nnoremap <silent> <S-Left> :bprev<CR>
nnoremap <silent> <S-Right> :bnext<CR>

" ----------[ comfortable-motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

nnoremap <silent> <PageUp> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <PageDown> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <ScrollWheelUp> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
nnoremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>

" highlight all matched words on search, clear highlights with space key
nnoremap <silent> <space> :nohlsearch<CR>

" copy highlighted text in mouse mode
vmap <C-C> "+y"<CR>

" detach to the terminal shell
"nmap <C-D> :te<CR>

" view in hexmode
map <silent> <C-h> :Hexmode<CR>

" Map plus/minus for window sizing
if bufwinnr(1)
	map + <C-W>+
	map - <C-W>-
	map = <C-W>=
	map <Tab> <C-W>w
endif

" Only Highlight the current line in the active window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Remember last cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Don't expand tabs when editing Makefiles
autocmd FileType make setlocal noexpandtab

" Trim spurious whitespaces on save
" enable both features globally
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
" blacklist without markdown
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
" disable stripping for markdown files
autocmd FileType markdown DisableStripWhitespaceOnSave

" ----------[ various settings
set number
set mouse=a
set mousehide

set splitbelow
set splitright

set background=dark

" Let vim use the system clipboard
set clipboard^=unnamedplus,unnamed

" Turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/undo/

" Maintain hidden buffers
set hidden

set history=1000

" make backspace sane
set backspace=indent,eol,start

" Wrapping
"set textwidth=79
set textwidth=80
set colorcolumn=+1
set wrap                    " turn on line wrapping
set wrapmargin=5            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

" Indenting
set autoindent              " automatically set indent of new line
set smartindent

" Tabs and spaces
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'

" Misc.
set ttyfast                 " faster redrawing
set showtabline=2           " always show tabline
set laststatus=2            " show the status line all the time
set cursorline              " highlight the current line
set wildmenu                " enhanced command line completion
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=10            " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros
set magic

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" No error bells
set noerrorbells
set visualbell

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" =====================================
"                  Interface
" =====================================

" toggle invisible characters off by default
set nolist
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" replace the default box drawing characters
set fillchars=vert:│,fold:─,diff:─

" =====================================
"                   Mappings
" =====================================

" comma as leader
let mapleader = ','

" Display all leaders
nnoremap <silent> <leader>, :map ,<CR>

" Move around viewports
"nnoremap <M-h> <C-W>h
"nnoremap <M-j> <C-W>j
"nnoremap <M-k> <C-W>k
"nnoremap <M-l> <C-W>l

" Handy remap to get out of insert mode
inoremap jk <Esc>

" Remove search highlighting
nnoremap <silent> jk :noh<CR>

" Remove search highlighting
cnoremap <silent> jk <Esc>

" Run make in current directory
nnoremap <silent> <leader>m :make!<CR>

" Toggle list symbols
nnoremap <silent> <leader>l :set list!<CR>

" Toggle relative numbers
nnoremap <silent> <leader>n :set relativenumber!<CR>

" Make Y move like D and C
noremap Y y$

" Reformat indentation and spacing
nnoremap <silent> <leader>r gg=G<CR>
"nnoremap <silent> <leader>r :retab <CR>

" Quickly edit init.vim
nnoremap <silent> <leader>e :e ~/.config/nvim/init.vim<CR>

" Source init.vim
"nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>

" Source init.vim
nnoremap <silent> <leader>s :so ~/.config/nvim/init.vim<CR>

" Quickly edit plugins
"nnoremap <silent> <leader>ep :e ~/.config/nvim/plugins.vim<CR>

" Scroll viewport
"nnoremap <PageUp> 5<C-y>
"nnoremap <PageDown> 5<C-e>
"inoremap <PageUp> <Esc>5<C-y>
"inoremap <PageDown> <Esc>5<C-e>

" Re-highlight indented selection
vnoremap < <gv
vnoremap > >gv

" Improve up and down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Keep search pattern at center of screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Search for word under cursor
nnoremap <leader>/ "fyiw :/<c-r>f<CR>

" =====================================
"               Plugin: NERDTree
" =====================================

"let g:WebDevIconsOS = 'Darwin'
"let g:webdevicons_enable = 1

" Toggle NerdTree
"nnoremap <silent> <leader>k :NERDTreeToggle<CR>

" Show hidden files
"let g:NERDTreeShowHidden = 1

"webdevicons图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

"let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

hi Directory guifg=#689d6a

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Close if only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =====================================
"               Plugin: Fugitive
" =====================================

" git status
nnoremap <leader>gs :Gstatus<CR>

" git diff
nnoremap <leader>gd :Gdiff<CR>

" git add .
nnoremap <leader>ga :Git add .<CR><CR>

" git commit -v -q - verbose and quiet
nnoremap <leader>gc :Gcommit -v -q<CR>

" git log - opens in quickfix windows to navigate to commits
nnoremap <silent> <leader>gl :silent! Glog<CR>:bot copen<CR>

" =====================================
"                Plugin: Tagbar
" =====================================

" Toggle Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors")) " set true colors
	set termguicolors
endif

if (has("guicursor"))
	set guicursor
endif

syntax enable

let $LOCALCONFIG = $HOME . "/.vim/localconfig.vim"
if filereadable($LOCALCONFIG)
	source $LOCALCONFIG
endif

let $COLORSCHEME = $HOME . "/.vim/colorscheme.vim"
if filereadable($COLORSCHEME)
	source $COLORSCHEME
endif
