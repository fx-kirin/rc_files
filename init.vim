set undodir=~/.nvimundo
set directory=~/.nvimswap//
set viminfo+=n~/.nvim/viminfo

" s - DeinVim Install
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/nvim/dein')
    call dein#begin('~/.cache/nvim/dein')

    call dein#add('~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim')
    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    " TOML を読み込み、キャッシュしておく
    call dein#load_toml('~/.vim/vim/rc/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/vim/rc/dein_lazy.toml', {'lazy': 1})
    
    call dein#load_toml('~/.vim/nvim/rc/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/nvim/rc/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
    call dein#call_hook('source')
    call dein#check_lazy_plugins()
endif

if dein#check_install()
  call dein#install()
endif

let output1=system("find -L ".$HOME."/.cache/dein/repos/github.com/fx-kirin -printf '%T@\\n' | sort -r | head -n 1")[:-2]
let output2=system("stat -L -c '%Y' ~/.config/vim/init.vim")[:-2]
let output3=system("find -L ".$HOME."/.vim/vim/rc -printf '%T@\\n' | sort -r | head -n 1")[:-2]
let modified_date_filename=$HOME."/.nvimrc_last_modified_date"
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

source ~/.config/vim/init.vim

" --s Setting for firenvim
function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction

function! TimerSetLinesForFirefox(timer)
    call SetLinesForFirefox()
endfunction

function! TimerFucusPageAndKill(timer)
    call rpcnotify(firenvim#get_chan(), 'focus_page_and_firenvim_vimleave')
endfunction

function! TimerFucusPage(timer)
    call firenvim#focus_page()
endfunction

function! SetLinesForFirefox()
    set lines=28 columns=110 laststatus=0
endfunction

function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
    set guifont=Cica:h14
    nnoremap <silent> <Leader>f :call SetLinesForFirefox()<CR>
    nnoremap <silent> <S-Esc> :w<CR>:call timer_start(500, function("TimerFucusPage"))<CR>
    nnoremap <silent> <C-Esc> :w<CR>:call timer_start(500, function("TimerFucusPageAndKill"))<CR>
    au BufEnter 192.168.100.114*ipynb*.txt set filetype=python
    au BufEnter github*.txt set filetype=markdown
    au BufEnter stackoverflow*.txt set filetype=markdown
    " call timer_start(500, function("TimerSetLinesForFirefox"))
  endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
" --e Setting for firenvim

if filereadable(expand("~/.vim/nvim/bundle/snake/plugin/snake.vim"))
    source ~/.cache/nvim/dein/repos/github.com/amoffat/snake/plugin/snake.vim
endif
