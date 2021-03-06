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
set list  " 不可視文字を表示する
set listchars=tab:>-,trail:-  " タブを >--- 半スペを . で表示する

" To use vim-rooter
let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = ''
let g:rooter_patterns = [
    \'.git', '_darcs', '.hg', '.bzr', '.svn',
    \'Makefile', '.nvimsessions', 'src', '.vimsessions'
\]

set incsearch
set hlsearch
set undofile
set guitablabel=%t
set cursorline
set hidden " Allows us to open a new buffer without saving
set noshowmode " delete '— INSERT --' text 
set history=10000
set switchbuf=usetab 

set foldmethod=indent  "折りたたみ範囲の判断基準（デフォルト: manual）
set foldlevel=99        "ファイルを開いたときにデフォルトで折りたたむレベル

imap kj <ESC>
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap <Down> gj
vnoremap <Up>   gk
imap <F1>  <NOP>

" Avoiding mistype
nnoremap q: :q

" To select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
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

" Calc replace
vmap n <Plug>AutoCalcReplace

" to make arrow key works correctly

let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = ''

let g:AutoPairsUseInsertedCount = 1

let mapleader = "\<Space>"

" To prevent auto deleting indent
nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap <silent> <C-Right> :tabn<CR>
nnoremap <silent> <C-Left> :tabp<CR>
nnoremap <silent> <C-Down> :tabc<CR>
nnoremap <silent> <Leader>l :tabn<CR>
nnoremap <silent> <Leader>h :tabp<CR>
nnoremap <silent> <Leader>L :tabm +1<CR>
nnoremap <silent> <Leader>H :tabm -1<CR>
vnoremap <silent> <Leader>l :<C-u>tabn<CR>
vnoremap <silent> <Leader>h :<C-u>tabp<CR>
vnoremap <silent> <Leader>L :<C-u>tabm +1<CR>
vnoremap <silent> <Leader>H :<C-u>tabm -1<CR>
nnoremap <silent> <Leader>d :tabc<CR>
nnoremap <silent> <Leader>D :BufOnly<CR>:tabonly<CR>
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


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme monokai_pro
hi Visual ctermbg=237 guibg=#0077b3
hi Search guibg=#fada5e guifg=#2d2a2e gui=none
hi Comment guifg=#b8b8cb


function! SlimeTarget()
  if exists("b:slime_config")
    let l:target = b:slime_config['target_pane']
    return strlen(l:target) > 0 ? l:target : ''
  endif
  return ''
endfunction

let g:airline_theme             = 'monokai_pro'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline_powerline_fonts = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline_section_z = "%p%% %#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%v %#__accent_bold#[%#__restore__#%{SlimeTarget()}%#__accent_bold#]%#__restore__#"
let g:airline_section_c = "%<%<%{expand('%:p')} %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#"

let NERDTreeIgnore = ['\.\.$', '\.$', '\.pyc$', '\.sw.$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeQuitOnOpen = 1
let NERDTreeMapOpenInTab='<ENTER>'

let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.nvimsessions')
if isdirectory(s:local_session_directory) && len(v:argv) <= 1 && getcwd() != $HOME
  let g:session_directory = s:local_session_directory
  silent exec "!easynohup guake -i " $GUAKE_TAB_UUID " --rename-tab \"vim "expand('%:p:h:t')"\""
else
  let g:session_directory = '~/.nvimsessions'
  if len(v:argv) <= 1
    silent exec "!easynohup guake -i " $GUAKE_TAB_UUID " --rename-tab \"vim "join(v:argv[1:], " ")"\""
  else
    silent exec "!easynohup guake -i " $GUAKE_TAB_UUID " --rename-tab \"vim "expand('%:t')"\""
  endif
endif
autocmd VimLeave * silent exec "!easynohup guake -i " $GUAKE_TAB_UUID " --rename-tab " whoami
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
nnoremap <silent> <Leader>- :!tmux split-window -v -p 30 -c '%:p:h' -d<CR>:let b:slime_config = {"socket_name": "default", "target_pane": ".2"}<CR>

if  whoami =~ 'zenbook'
    let g:slime_default_config = {"socket_name": "default", "target_pane": "vim-output:.1"}
else
    let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
endif

let g:slime_dont_ask_default = 1
nmap <F1> :SlimeSend0 "\e[A\n"<CR>
vmap <F1> :SlimeSend0 "\e[A\n"<CR>
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


" Completor
let g:completor_python_binary = $HOME.'/.pyenv/versions/3.8.3/bin/python'
let g:completor_racer_binary = $HOME.'/.cargo/bin/racer'
let g:completor_complete_options = ''
let g:completor_auto_trigger = 0
" Disabling all file type
let g:completor_whitelist = []
let g:completor_complete_options = 'noselect'
let g:completor_def_split = 'tab'
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

set completeopt-=preview

" ALE setting
let g:ale_linters = {'rust': ['cargo', 'rustfmt', 'rls']}
let g:ale_python_pyre_use_global=1
let g:airline#extensions#ale#enabled = 1
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_hover_to_preview=1
let g:ale_cursor_detail=1
let g:ale_echo_cursor=1
let g:ale_echo_delay=500
let g:ale_lint_delay=500
let g:ale_close_preview_on_insert=1
highlight SpellCap guisp=Orange

" Echodoc, the plugin to show function signatures.
let g:echodoc#enable_at_startup=1
let g:echodoc#type="floating"
highlight link EchoDocFloat Pmenu

" Autoflake8 Settings
let g:autopep8_ignore="E402,E265"
let g:autopep8_max_line_length=255
let g:autopep8_disable_show_diff=1

autocmd FileType python nnoremap <Leader>o :let b:last_line = line(".")<CR>:Black<CR>:Autopep8<CR>:<C-r>=b:last_line<CR><CR>
autocmd FileType python nnoremap <Leader>i :Isort<CR>
let g:vim_isort_config_overrides = {'float_to_top': 1}

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
let g:pymode_trim_whitespaces = 0

let g:neomru#do_validate = 0
let g:neomru#file_mru_ignore_pattern = '\~$\|\.\%(o\|exe\|dll\|bak\|zwc\|pyc\|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/temp/\|/run/user/\|/tmp/\|\%(/private\)\=/var/folders/\)\|\%(^\%(fugitive\)://\)\|\%(^\%(term\)://\)'
let g:neomru#directory_mru_ignore_pattern = '\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/temp/\|/run/user/\|/tmp/\|\%(/private\)\=/var/folders/\)'

" Define mappings
call denite#custom#map('insert', "<C-n>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-p>", '<denite:move_to_previous_line>')
call denite#custom#map('insert', "<Up>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<Down>", '<denite:move_to_previous_line>')
autocmd FileType denite call s:denite_my_settings()
autocmd FileType denite VimadeBufDisable
autocmd FileType denite-filter call s:denite_filter_my_settings()
autocmd FileType denite-filter VimadeBufDisable
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> e
  \ denite#do_map('do_action', 'edit')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <ESC>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> o
  \ denite#do_map('do_action', 'open')
endfunction

function! s:denite_filter_my_settings() abort
  imap <silent><buffer> kj <Plug>(denite_filter_quit)
  imap <silent><buffer><expr> <ESC> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action', 'open')
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action', 'open')
endfunction

nnoremap <C-d>f. :Files .
nnoremap <silent> <Leader>t :Windows<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <C-d>wp :call skim#run({'source': 'fd -L .', 'sink': 'tab split', 'dir':'~/workspace'})<CR>
nnoremap <silent> <C-d>wr :call skim#run({'source': 'fd -L .', 'sink': 'tab split', 'dir':'~/rust_workspace'})<CR>
nnoremap <silent> <C-d>y :Denite history/yank<CR>
nnoremap <silent> <C-d>b :Buffers<CR>
nnoremap <silent> <C-d>r :Denite -buffer-name=register register<CR>
nnoremap <silent> <C-d>k :Marks<CR>
nnoremap <silent> <C-d>m :FZFMru<CR>
nnoremap <silent> <C-d>l :Lines<CR>
nnoremap <silent> <C-d>t :Windows<CR>
nnoremap <silent> <C-d>h :Files ~<CR>
nnoremap <silent> <C-d>c :Files .<CR>
nnoremap <silent> <C-d>1 :Files .<CR>
nnoremap <silent> <C-d>2 :Files ..<CR>
nnoremap <silent> <C-d>3 :Files ../..<CR>
nnoremap <silent> <C-d>4 :Files ../../..<CR>
nnoremap <silent> <C-d>5 :Files ../../../..<CR>
" call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('normal', '<C-J>', '<denite:scroll_page_forwards>', 'noremap')
" call denite#custom#map('normal', '<C-K>', '<denite:scroll_page_backwards>', 'noremap')
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#option('default', {
\    'prompt':         '❯',
\    'start_filter':   v:true,
\    'auto_resize':    v:true,
\    'ignorecase':     v:false,
\    'smartcase':      v:true,
\    'source_names':   'short',
\    'filter_updatetime': 100,
\    'status_line': v:false
\ })
call denite#custom#source('buffer', 'converters', ['converter/prioritize_basename'])
call denite#custom#source('file_mru,file/rec', 'converters', ['converter/prioritize_basename'])

" Setting for skim
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
" let g:skim_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': 'enew' }

let g:skim_action = {'enter': 'tab split', 'ctrl-o': 'open'}
let g:fzf_action = {'enter': 'tab split', 'ctrl-o': 'open'}

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
                        \ 'map': { 'prefix': 'm' }, 
                        \ 'table': { 'align': {"default": "left"}} }

nnoremap <silent> <Leader>v :vertical resize 31<CR>
nnoremap <F11> :UndotreeToggle<cr>

let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" mark auto reg
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>m :<C-u>call <SID>AutoMarkrement()<CR>
autocmd InsertEnter * call <SID>AutoMarkrement()
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
endfunction

nnoremap <leader>gs :tab sp<CR>:Gstatus<CR>:only<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gh :tab sp<CR>:0Glog<CR>
" abbrev for `git history`: create new quickfix tab for history
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gg :Ggrep 

let g:taboo_tab_format="%r%m"

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "maintained",
"  highlight = {
"    enable = true,
"    disable = {
"    }
"  }
"}
"EOF

if filereadable(expand("~/.nvim/bundle/snake/plugin/snake.vim"))
    source ~/.cache/dein/repos/github.com/amoffat/snake/plugin/snake.vim
endif
