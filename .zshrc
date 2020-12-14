source ~/.zprofile
export ZPROFILE_LOADED=1

bindkey -v # vim mode
bindkey -M viins 'kj' vi-cmd-mode
bindkey -r '^[' 
setopt +o nomatch
bindkey '^[[Z' reverse-menu-complete

### Added by Zplugin's installer
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# End of zinit's installer chunk

zinit light Aloxaf/fzf-tab # Tab の選択候補を fzf する
zinit load momo-lab/zsh-abbrev-alias # 略語を展開する
zinit load zsh-users/zsh-completions # 補完
zinit load zsh-users/zsh-syntax-highlighting
zinit load mollifier/cd-gitroot # git root
zinit load jimeh/zsh-peco-history
zinit load woefe/git-prompt.zsh
zinit load supercrabtree/k
zinit load caarlos0/zsh-mkc
zinit load docker/cli
zinit load kutsan/zsh-system-clipboard
zinit load zsh-users/zsh-autosuggestions
autoload -Uz vcs_info

export PROMPT="$ "
export RPROMPT='$(gitprompt)'
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgreprc
export ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
export ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}● "
export ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚ "
export ZSH_THEME_GIT_PROMPT_UNTRACKED="… "
export ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑ "
export ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔ "
    
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

fpath=(/home/$USER/github/zsh-completions/src $fpath)
autoload -U compinit
compinit

alias ed='cd ,'
alias ll='exa -hla --git --git-ignore'
alias la='ls -A'
alias l='ls -CF'
alias ls='exa '
alias grep='grep --color=auto -i'
alias fgrep='fgrep --color=auto -i'
alias egrep='egrep --color=auto -i'

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias vim="nvim"
alias ovim="/usr/local/bin/vim"

zstyle ':completion:*' menu select # Highlighting tab selection.

autoload -Uz colors
colors
if [ $USER == "zenbook" ]; then
    if [ -z $FROMBASH ]; then
        test $(tmux list-panes | wc -l) -eq 1 && guake -r $(whoami);
    fi
    precmd() { 
        print -rP "%{$fg[yellow]%}|%D %*|%{$fg_bold[green]%}%n%{${reset_color}%}:%{$fg_bold[blue]%~%{${reset_color}%}";
    }
else
    precmd() { 
        print -rP "%{$fg[yellow]%}|%D %*|%{$fg_bold[green]%}%n%{${reset_color}%}:%{$fg_bold[blue]%~%{${reset_color}%}";
    }
fi

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_space # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_reduce_blanks  # 余分な空白は詰めて記録
setopt hist_save_no_dups # 古いコマンドと同じものは無視 
setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_expand # 補完時にヒストリを自動的に展開         
setopt inc_append_history # 履歴をインクリメンタルに追加

# インクリメンタルからの検索
# 文字列の確認の方法はctrl+V -> 確認したいキーコード
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

# zsh-system-clipboard
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

alias rsync_diginnos_bitcoin='rsync -a -v --delete --exclude=*.o --exclude=*.so --exclude=*chrome* --exclude=*.log ~/workspace/bitcoin_trader diginnos:workspace/'
alias wine='WINEPREFIX=/home/'$USER'/.PlayOnLinux/wineprefix/metatrader4 WINEARCH="win32" /home/'$USER'/.PlayOnLinux/wine/linux-x86/4.14/bin/wine'
alias wine-python='WINEPREFIX=/home/'$USER'/.PlayOnLinux/wineprefix/metatrader4 WINEARCH="win32" /home/'$USER'/.PlayOnLinux/wine/linux-x86/4.14/bin/wine python'
alias wine-pip='WINEPREFIX=/home/'$USER'/.PlayOnLinux/wineprefix/metatrader4 WINEARCH="win32" /home/'$USER'/.PlayOnLinux/wine/linux-x86/4.14/bin/wine python -m pip'
alias jd='sh /home/'$USER'/2chproxy.pl/jd.sh'
alias cloud_mount='~/scripts/mount_cloud.py'
alias ethel_balance_all='python /media/'$USER'/Kazma/UserFile/CloudStation/workspace/bitcoin_trader/scripts/get_all_account_balance.py'
alias e='eigo'
alias ipython='ptipython'
alias pip3='python3 -m pip'
alias sdmusic='python3 -m sd_music.start'
alias aria='aria2c -x 8 -s 8'
alias nemohere='PAHT=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/go/bin:/home/'$USER'/go/bin nohup nemo . > /dev/null 2>&1 &'
alias symount='sudo sshfs -o allow_other -oIdentityFile=/root/ssh_keys/synology synology@192.168.100.106:/ /media/synology'
alias rymount='sudo sshfs -o allow_other -oIdentityFile=/root/ssh_keys/ryzen ryzen@192.168.100.111:/home/ryzen /media/ryzen -p 9822'
alias gis='git status -uall -s'
alias gull='git pull origin master'
alias gush='git push origin master'
alias ra='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias jupyter-execute='jupyter nbconvert --ExecutePreprocessor.timeout=-1 --execute --clear-output'
alias jupymux='tmux new -d -s jupyter jupyter notebook'

# Fixig pip bug
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

eval "$(dircolors -b ~/.dircolors)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# http://yut.hatenablog.com/entry/20111125/1322177659
setopt auto_param_keys # カッコの対応などを自動的に補完
setopt auto_param_slash # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt NO_beep # ビープ音を鳴らさないようにする
setopt magic_equal_subst # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt mark_dirs # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt print_eight_bit # 8 ビット目を通すようになり、日本語のファイル名を表示可能
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # ファイルリスト補完でもlsと同様に色をつける｡
setopt auto_cd # ディレクトリ名だけで､ディレクトリの移動をする｡
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }
setopt auto_list # 補完候補が複数ある時に、一覧表示

export BAT_THEME="OneHalfDark"

if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

if [ $USER == "zenbook" ]; then
    alias gitpitch='docker run -it --rm -v /home/zenbook/gitpitch_presentations:/repo -p 9000:9000 gitpitch/desktop:pro'
    alias newtab='guake -n NEW_TAB -e "cd \"$(readlink -f .)\""'
    alias pwork='(guake -r "Python" > /dev/null 2>&1 &);cd $PYTHON_WORKSPACE && vim && guake -r $(whoami)'
    alias rwork='(guake -r "Rust" > /dev/null 2>&1 &);cd $RUST_WORKSPACE && vim && guake -r $(whoami)'
    alias ssh='(){if [ -z $FROMBASH ];then (test $(tmux list-panes | wc -l) -eq 1 && guake -r $1 &);fi; /usr/bin/ssh $@ && guake -r $(whoami)}'
    compdef ssh='ssh'
    setopt complete_aliases
fi


[[ $- == *i* ]] && source "/home/zenbook/.skim/shell/completion.zsh" 2> /dev/null
source "/home/$USER/.skim/shell/key-bindings.zsh"


source /home/$USER/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.fzf/shell/completion.zsh
