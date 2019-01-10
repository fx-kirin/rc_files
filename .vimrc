set nocompatible
set ff=unix
set iminsert=0
set imsearch=-1
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set magic
syntax on
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set wrap
set number
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set hlsearch
set autochdir
set undodir=~/.vimundo
set directory=~/.vimswap
set undofile
set guitablabel=%t
set cursorline
set hidden " Allows us to open a new buffer without saving
set noshowmode " delete '— INSERT --' text 

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap <Down> gj
vnoremap <Up>   gk

" To Use vim-surround
nmap sa <Plug>Ysurround
nmap sd <Plug>Dsurround
nmap sc <Plug>Csurround

" to make arrow key works correctly


" s - DeinVim Install
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    if !has('nvim')
        " プラグインリストを収めた TOML ファイル
        " 予め TOML ファイル（後述）を用意しておく
        let g:rc_dir = expand('~/.vim/rc')
        let s:toml = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

        " TOML を読み込み、キャッシュしておく
        call dein#load_toml(s:toml, {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})
    endif

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" for debug use
"call dein#recache_runtimepath()

filetype plugin indent on
syntax enable
" e - DeinVim Install
let mapleader = "\<Space>"

inoremap kj <ESC>
nnoremap <C-Right> :if &ft != "nerdtree" \| :bn! \| endif<CR>
nnoremap <C-Left> :if &ft != "nerdtree" \| :bp! \| endif<CR>
nnoremap <C-Down> :bp\|bd #<CR>
nnoremap <Leader>l :if &ft != "nerdtree" \| :bn! \| endif<CR>
nnoremap <Leader>h :if &ft != "nerdtree" \| :bp! \| endif<CR>
nnoremap <Leader>d :bp\|bd #<CR>
nnoremap <Leader>D :BufOnly<CR>
nnoremap <Leader>j <C-w><C-w>
nnoremap <Leader>k <C-w>W
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <C-j> <C-F>
nnoremap <C-k> <C-B>
nnoremap \j :res +5<CR>
nnoremap \k :res -5<CR>
nnoremap \h :vertical resize +5<CR>
nnoremap \l :vertical resize -5<CR>
nnoremap <Leader>w :w<CR>

" Back to the beginning of selection
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set softtabstop=2
autocmd FileType mql4 set shiftwidth=3
autocmd FileType mql4 set tabstop=3
autocmd FileType mql4 set softtabstop=3

colorscheme monokai

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'monokai'
let g:airline#extensions#tabline#fnamemod = ':t'

let NERDTreeIgnore = ['\.\.$', '\.$', '\.pyc$', '\.sw.$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
if isdirectory(s:local_session_directory)
  let g:session_directory = s:local_session_directory
  let g:session_autosave = 'yes'
  let g:session_autoload = 'yes'
  let g:session_autosave_periodic = 1
else
  let g:session_directory = '~/.vimsessions'
  let g:session_autosave = 'yes'
  let g:session_autoload = 'yes'
  let g:session_autosave_periodic = 1
endif
unlet s:local_session_directory

if !exists("g:load_only_once_for_vim_session")
augroup PluginSession
  au VimEnter * nested call xolox#session#auto_load()
  au VimLeavePre * call xolox#session#auto_save()
  au VimLeavePre * call xolox#session#auto_unlock()
  au BufEnter * call xolox#session#auto_dirty_check()
augroup END
let g:load_only_once_for_vim_session = 1
endif

" Tmux Slime Settings
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_dont_ask_default = 1
nmap <F2> <Plug>SlimeLineSendgj
nmap <F1> <Plug>SlimeLineSendgj:SlimeSend0 "\r\n"<CR>
autocmd FileType python nmap <Leader><F2> :SlimeSend0 "from IPython import embed; embed()\n"<CR>:call IPythonEmmbedImport()<CR>
autocmd FileType python nmap <Leader><F3> :SlimeSend1 from reload_all import reload_all;reload_all(locals())<CR>
autocmd FileType python nmap <Leader><F4> :call IPythonEmmbedImport()<CR>
autocmd FileType python nmap <Leader><F5> :SlimeSend0 "from reload_all import reload_all; reload_all(locals())\n"<CR>
xmap <F2> <Plug>SlimeRegionSend
autocmd FileType python nmap <F10> :SlimeSend0 "python '".expand('%:p')."'\n"<CR>
autocmd FileType python nmap <Leader><F10> :SlimeSend0 "wine-python '".expand('%:p')."'\n"<CR>
autocmd FileType python nmap <Leader>b :SlimeSend0 "b ".expand('%:p').":".line(".")."\n"<CR>
autocmd FileType python nmap <F11> :SlimeSend0 "%run '".expand('%:p')."'\n"<CR>

noremap <F3> :NERDTreeToggle<CR>
noremap <C-e> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.\.$', '\.$', '\.pyc$', '\.sw.$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" Completer
let g:completor_python_binary = '/home/zenbook/.pyenv/versions/miniconda3-4.1.11/bin/python'
let g:completor_auto_trigger = 1
let g:completor_complete_options = 'menuone,noselect'
" let g:completor_debug = 1
inoremap <expr> <C-N> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
nnoremap <silent> <Leader>s :call completor#do('signature')<CR>

if (executable("gconftool-2") && has("autocmd") && !has("gui_running"))
    au InsertEnter * silent execute "!echo -en \<esc>[5 q"
    au InsertLeave * silent execute "!echo -en \<esc>[2 q"
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Autoflake8 Settings
let g:autopep8_ignore="E402,E265"
let g:autopep8_max_line_length=255
let g:autopep8_disable_show_diff=1

autocmd FileType python nnoremap <Leader>8 :Autopep8<CR>:Isort<CR>:w<CR>
