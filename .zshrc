bindkey -v # vim mode
setopt +o nomatch
bindkey '^[[Z' reverse-menu-complete

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
# End of Zplugin's installer chunk
#
export ENHANCD_DISABLE_HOME=0
export ENHANCD_HOME_ARG=,
export ENHANCD_DOT_ARG=...

zplugin load zsh-users/zsh-autosuggestions # 必ずsyntax highliting の前に呼ぶこと。
zplugin load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zplugin load momo-lab/zsh-abbrev-alias # 略語を展開する
zplugin load zsh-users/zsh-completions # 補完
zplugin load mollifier/cd-gitroot # git root
zplugin load b4b4r07/enhancd
zplugin load jimeh/zsh-peco-history
zplugin load woefe/git-prompt.zsh
autoload -Uz vcs_info

alias ed='cd ,'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --color=auto -i'
alias fgrep='fgrep --color=auto -i'
alias egrep='egrep --color=auto -i'

zstyle ':completion:*' menu select # Highlighting tab selection.

autoload -Uz colors
colors
precmd() { print -rP "%{$fg[yellow]%}|%*|%{$fg_bold[green]%}%n%{${reset_color}%}:%{$fg_bold[blue]%~%{${reset_color}%}" }
export PROMPT="$ "
export RPROMPT='$(gitprompt)'

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
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

alias rsync_diginnos_bitcoin='rsync -a -v --delete --exclude=*.o --exclude=*.so --exclude=*chrome* --exclude=*.log ~/workspace/bitcoin_trader diginnos:workspace/'
alias wine='WINEPREFIX=/home/zenbook/.PlayOnLinux/wineprefix/Line WINEARCH="win32" wine'
alias jd='sh /home/zenbook/2chproxy.pl/jd.sh'
alias cloud_mount='~/scripts/mount_cloud.py'
alias ethel_balance_all='python /media/zenbook/Kazma/UserFile/CloudStation/workspace/bitcoin_trader/scripts/get_all_account_balance.py'
alias e='eigo'
alias pip3='python3 -m pip'
alias sdmusic='python3 -m sd_music.start'
alias wget='aria2c -x 8 -s 8'
alias nemohere='PAHT=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/go/bin:/home/zenbook/go/bin nohup nemo . > /dev/null 2>&1 &'
alias symount='sudo sshfs -o allow_other -oIdentityFile=/root/ssh_keys/synology synology@192.168.100.106:/ /media/synology'
alias rymount='sudo sshfs -o allow_other -oIdentityFile=/root/ssh_keys/ryzen ryzen@192.168.100.111:/home/ryzen /media/ryzen -p 9822'
alias gis='git status -uall -s'
alias gull='git pull origin master'
alias gush='git push origin master'
alias ra='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

eval "$(dircolors -b ~/.dircolors)"

if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# Codes for autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242' # color for autosuggestions
AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=242'
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}") # Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char) # Add forward-char widgets to PARTIAL_ACCEPT
bindkey '^[[1;5C' forward-word
bindkey '^[OC' forward-char
