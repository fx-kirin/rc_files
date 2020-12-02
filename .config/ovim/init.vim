set undodir=~/.vimundo
set directory=~/.vimswap//
set viminfo+=n~/.ovim/viminfo

" s - DeinVim Install
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/vim/dein')
    call dein#begin('~/.cache/vim/dein')

    call dein#add('~/.cache/vim/dein/repos/github.com/Shougo/dein.vim')
    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    " TOML を読み込み、キャッシュしておく
    call dein#load_toml('~/.vim/vim/rc/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/vim/rc/dein_lazy.toml', {'lazy': 1})
    call dein#load_toml('~/.vim/ovim/rc/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/ovim/rc/dein_lazy.toml', {'lazy': 1})

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
let output3=system("find -L ".$HOME."/.vim/vim/rc -printf '%T@\\n' | sort -r | head -n 1")[:-2]
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

source ~/.config/vim/init.vim

if filereadable(expand("~/.vim/ovim/bundle/snake/plugin/snake.vim"))
    source ~/.cache/vim/dein/repos/github.com/amoffat/snake/plugin/snake.vim
endif
