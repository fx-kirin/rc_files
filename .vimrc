" PATHの自動更新関数
" | 指定された path が $PATH に存在せず、ディレクトリとして存在している場合
" | のみ $PATH に加える
function! IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction

" ~/.pyenv/shims を $PATH に追加する
" これを行わないとpythonが正しく検索されない
call IncludePath(expand("~/.pyenv/shims"))

" Add path to read pyenv python.
" https://lambdalisue.hatenablog.com/entry/2014/05/21/065845

" To Fix an Error
" E836: This Vim cannot execute :py3 after using :python
" https://robertbasic.com/blog/force-python-version-in-vim/
if has('python3')
endif

let g:username="fx-kirin"
let g:email="fx.kirin@gmail.com"
set nocompatible
set ff=unix
set iminsert=0
set imsearch=-1
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,mac,dos
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
set directory=~/.vimswap//
set viminfo+=n~/.vim/viminfo
set undofile
set guitablabel=%t
set cursorline
set hidden " Allows us to open a new buffer without saving
set noshowmode " delete '— INSERT --' text 
set history=10000

set foldmethod=indent  "折りたたみ範囲の判断基準（デフォルト: manual）
set foldlevel=99        "ファイルを開いたときにデフォルトで折りたたむレベル

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

" To select pasted text
nnoremap gp `[v`]
" Search selected text
vnoremap ? y/\V<C-R>=escape(@",'/\')<CR><CR>

vnoremap s :s/
vnoremap a :S/

" Search selected word in a visual mode
vnoremap * y/\<\V<C-r>=escape(@",'/\')<CR>\><CR>

" To Use vim-surround
nmap sa <Plug>Ysurround
nmap sd <Plug>Dsurround
nmap sc <Plug>Csurround

" to make arrow key works correctly

" ALE setting
let g:ale_python_pyre_use_global=1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'rust': ['cargo', 'rustfmt', 'rls']}

let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = ''

let g:AutoPairsUseInsertedCount = 1

" s - DeinVim Install
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir = expand('~/.vim/rc')
    let s:toml = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
    call dein#call_hook('source')
    call dein#check_lazy_plugins()
endif

if dein#check_install()
  call dein#install()
endif

let output1=system("find -L ".$HOME."/.cache/dein/repos/github.com/fx-kirin -printf '%T@\\n' | sort -r | head -n 1")[:-2]
let output2=system("stat -L -c '%Y' ~/.vimrc")[:-2]
let output3=system("find -L ".$HOME."/.vim/rc -printf '%T@\\n' | sort -r | head -n 1")[:-2]
let modified_date_filename=$HOME."/.vimrc_last_modified_date"
if filereadable(modified_date_filename)
    let lastdate=readfile(modified_date_filename)[0]

else
    let lastdate=0
endif
if output1 > output2
    if output3 > output1
        let modified_date=output3
    else
        let modified_date=output1
    endif
else
    if output3 > output2
        let modified_date=output3
    else
        let modified_date=output1
    endif
endif
let whoami=system('whoami')
if modified_date > lastdate && whoami != 'root'
    call dein#recache_runtimepath()
    call writefile([modified_date], modified_date_filename)
endif

filetype plugin indent on
syntax enable
" e - DeinVim Install

let mapleader = "\<Space>"

inoremap kj <ESC><C-l>
" To prevent auto deleting indent
nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap <silent> <C-Right> :if &ft != "nerdtree" \| :bn! \| endif<CR>
nnoremap <silent> <C-Left> :if &ft != "nerdtree" \| :bp! \| endif<CR>
nnoremap <silent> <C-Down> :bp\|bd #<CR>
nnoremap <silent> <Leader>l :if &ft != "nerdtree" \| :bn! \| endif<CR>
nnoremap <silent> <Leader>h :if &ft != "nerdtree" \| :bp! \| endif<CR>
nnoremap <silent> <Leader>d :bp\|bd #<CR>
nnoremap <silent> <Leader>D :BufOnly<CR>
nnoremap <silent> <Leader>j <C-w><C-w>
nnoremap <silent> <Leader>k <C-w>W
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>d "+d
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P
vnoremap <silent> <Leader>p "+p
vnoremap <silent> <Leader>P "+P
nnoremap <C-j> <C-F>
nnoremap <C-k> <C-B>
vnoremap <C-j> <C-F>
vnoremap <C-k> <C-B>
nnoremap \j :res +5<CR>
nnoremap \k :res -5<CR>
nnoremap \h :vertical resize +5<CR>
nnoremap \l :vertical resize -5<CR>
nnoremap <silent><Leader>w :w<CR>
nnoremap <silent><Leader>q :q<CR>
nnoremap <Leader>/ /<C-r><C-w>/<CR>
cmap w!! w !sudo tee % >/dev/null

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
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set softtabstop=2

colorscheme monokai

function! SlimeTarget()
  if exists("b:slime_config")
    let l:target = b:slime_config['target_pane']
    return strlen(l:target) > 0 ? l:target : ''
  endif
  return ''
endfunction

let g:airline_theme             = 'monokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0
let g:airline_section_z = "%p%% %#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%v %#__accent_bold#[%#__restore__#%{SlimeTarget()}%#__accent_bold#]%#__restore__#"



let NERDTreeIgnore = ['\.\.$', '\.$', '\.pyc$', '\.sw.$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
if isdirectory(s:local_session_directory)
  let g:session_directory = s:local_session_directory
else
  let g:session_directory = '~/.vimsessions'
endif
unlet s:local_session_directory

set sessionoptions-=help
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
let g:session_verbose_messages = 0

if !exists("g:load_only_once_for_vim_session")
augroup PluginSession
  au VimEnter * nested silent! call xolox#session#auto_load()
  au VimLeavePre * silent! call xolox#session#auto_save()
  au VimLeavePre * silent! call xolox#session#auto_unlock()
  au BufEnter * silent! call xolox#session#auto_dirty_check()
augroup END
let g:load_only_once_for_vim_session = 1
endif

" Tmux Slime Settings
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

if  whoami =~ 'zenbook'
    let g:slime_default_config = {"socket_name": "default", "target_pane": "vim-output:.1"}
else
    let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
endif

let g:slime_dont_ask_default = 1
nmap <F1> :SlimeSend0 "\e[A\n"<CR>
nmap <F2> <Plug>SlimeLineSendgj
nnoremap <silent> <F8> :SlimeSend0 "cd '".expand('%:p:h')."'\n"<CR>
nnoremap <silent> <Leader><F8> :SlimeSend0 "cd ..\n"<CR>

autocmd FileType python nmap <Leader><F2> :SlimeSend0 "from IPython import embed; embed(user_ns=locals(), using=False)\n"<CR>:call IPythonEmmbedImport()<CR>
autocmd FileType python nmap <Leader><F4> :call IPythonEmmbedImport()<CR>
autocmd FileType python nmap <Leader><F5> :SlimeSend0 "from reload_all import reload_all; reload_all(locals())\n"<CR>
xmap <F2> <Plug>SlimeRegionSend
autocmd FileType python nmap <F10> :SlimeSend0 "python '".expand('%:p')."'\n"<CR>
autocmd FileType python nmap <Leader>b :SlimeSend0 "b ".expand('%:p').":".line(".")."\n"<CR>
autocmd FileType python nmap <F12> :SlimeSend0 "wine-python '".expand('%:p')."'\n"<CR>

autocmd FileType rust nmap <F4> :SlimeSend0 "cargo test --lib -- --nocapture\n"<CR>
autocmd FileType rust nmap <F5> :SlimeSend0 "cargo test --lib -- --nocapture --test ".expand('%:t:r')."\n"<CR>
autocmd FileType rust nmap <F10> :SlimeSend0 "cargo run\n"<CR>
autocmd FileType rust nmap <Leader>b :SlimeSend0 "b ".expand('%:p').":".line(".")."\n"<CR>

autocmd FileType mql4 nmap <F10> :SlimeSend0 "mqlcompile '".expand('%:p')."'\n"<CR>

nmap <F6> :let b:slime_config = {"socket_name": "default", "target_pane": ".2"}<CR>:let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}<CR>
nmap <Leader><F6> :let b:slime_config = {"socket_name": "default", "target_pane": "vim-output:.1"}<CR>:let g:slime_default_config = {"socket_name": "default", "target_pane": "vim-output:.1"}<CR>

" This is needed to apply autocmd for loaded buffers.
autocmd BufEnter * filetype detect

function! IPythonEmmbedImport()
    let topline = line(1)
    let botline = line("$")
    let text = ""
    for line in getline(topline, botline)
        if line =~ "^import"
            let text = text . line . "\n"
        end
        if line =~ "^from"
            let text = text . line . "\n"
        end
    endfor
    if text != ""
        execute 'SlimeSend1 '.text
    end
endfunction

noremap <F3> :NERDTreeToggle<CR>
noremap <C-u> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.\.$', '\.$', '\.pyc$', '\.sw.$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" deoplete
set completeopt-=preview
let g:deoplete#sources#jedi#python_path = $HOME.'/.pyenv/versions/3.8.3/bin/python'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'ignore_case': v:true,
\ 'smart_case': v:true,
\ 'on_insert_enter': v:false,
\ 'camel_case': v:true,
\})
let g:deoplete#sources#jedi#show_docstring = 0

" Completor
let g:completor_python_binary = $HOME.'/.pyenv/versions/3.8.3/bin/python'
let g:completor_racer_binary = $HOME.'/.cargo/bin/racer'
let g:completor_complete_options = ''
let g:completor_auto_trigger = 0
" Disabling all file type
let g:completor_whitelist = []
let g:completor_complete_options = 'noselect'
nnoremap <silent> <Leader>ss :call completor#do('signature')<CR>
nnoremap <silent> <Leader>si :call completor#do('signature_insert')<CR>
nnoremap <silent> <Leader>sa :call completor#do('signature_insert_with_attributes')<CR>
nnoremap <silent> <Leader>sj :call completor#do('definition')<CR>
nnoremap <silent> <Leader>sd :call completor#do('doc')<CR>

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

autocmd FileType python nnoremap <Leader>8 :Black<CR>:Autopep8<CR>:w<CR>
autocmd FileType python nnoremap <Leader>i :Isort<CR>:w<CR>

let g:pymode_python = 'python3'
let g:pymode_rope = 1 " enable rope
let g:pymode_lint_cwindow = 0 "disabling Quickfix windows
let g:pymode_options_colorcolumn = 0 " Disabling color column
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_run_bind = '<F15>'
let g:pymode_rope_regenerate_on_write = 0

let g:neomru#do_validate = 0
let g:neomru#file_mru_ignore_pattern = '\~$\|\.\%(o\|exe\|dll\|bak\|zwc\|pyc\|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/temp/\|/tmp/\|\%(/private\)\=/var/folders/\)\|\%(^\%(fugitive\)://\)\|\%(^\%(term\)://\)'
let g:neomru#directory_mru_ignore_pattern = '\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/temp/\|/tmp/\|\%(/private\)\=/var/folders/\)'

nnoremap <silent> <Leader>uy :Denite history/yank<CR>
nnoremap <silent> <Leader>ub :Denite buffer<CR>
nnoremap <silent> <Leader>ud :Denite directory_mru<CR>
nnoremap <silent> <Leader>ur :Denite -buffer-name=register register<CR>
nnoremap <silent> <Leader>uf :Denite -path=/media/zenbook/Kazma/UserFile/CloudStation/workspace file/rec<CR>
nnoremap <silent> <Leader>uu :Denite file_mru buffer<CR>
nnoremap <silent> <Leader>ua :Denite -resume<CR>
call denite#custom#map('insert', 'kj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<C-J>', '<denite:scroll_page_forwards>', 'noremap')
call denite#custom#map('normal', '<C-K>', '<denite:scroll_page_backwards>', 'noremap')

" to fix vimade bug
let g:vimade = {}
let g:vimade.detecttermcolors=0
let g:vimade.fadelevel=0.5

" Markdown
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 },
                        \ 'map': { 'prefix': 'm' } }

nnoremap <silent> <Leader>f :vertical resize 31<CR>
nnoremap <F11> :UndotreeToggle<cr>

let g:csv_no_conceal = 1 " Avoiding unexpected padding of vim.csv.

let g:UltiSnipsSnippetDirectories = ['UltiSnips']

if filereadable(expand("~/.vim/bundle/snake/plugin/snake.vim"))
    source ~/.cache/dein/repos/github.com/amoffat/snake/plugin/snake.vim
endif
