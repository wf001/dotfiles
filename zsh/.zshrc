# パスを追加したい場合
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/shims"
export PATH="$PATH:$PYENV_ROOT/bin"

export PATH="$PATH:$HOME/.nodenv/bin"
export PATH="$PATH:$HOME/.nodenv/versions/16.16.0/bin"

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/src/bin"
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

export PATH="$PATH:$HOME/.local/share/nvim/site/pack/packer/start/vim-iced/bin"


export EDITOR=nvim

eval "$(pyenv init -)"
eval "$(nodenv init -)"
eval "$(direnv hook zsh)"

if [ -e ".envrc" ];then
  eval "$(direnv allow .)"
fi


# エイリアス
alias ls='ls -GF --color'
alias l='ls -ltrG'
alias la='ls -laG'
alias ll='ls -laG'
alias c='cdr'

alias vi='nvim'
alias vim='nvim'
alias tmux='tmux -2'

alias vz='vim ~/.zshrc'
alias vvz='vim ~/.zshrc.local'
alias soz='source ~/.zshrc'

alias vv='vim ~/.config/nvim/init.lua'
alias vvv='vim ~/.config/nvim/lua/'
alias sov='source ~/.vimrc'

alias vt='vim ~/.tmux.conf'
alias sot='source ~/.tmux.conf'

alias vg='vim ~/.gitconfig'
alias vvg='vim ~/.gitconfig.local'
alias vig='vim .gitignore'

alias fig='find -name "*" |grep -v .git | grep -nr --color'
alias du='du -bh -d 1'

alias tf='terraform'


# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'
alias npml='npm ls --depth=0'
alias fsz='(){find . -name "*.$1" |grep -v ".venv" | grep -v "*test*" | xargs wc -l | sort -r |less}'
alias tree='tree -L 2'

# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF


# For curl query string
setopt nonomatch

# 日本語を使用
export LC_ALL=ja_JP.utf-8
export LANG=ja_JP.utf-8

#zstyle ':completion:*' ignore-parents parent pwd


# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
# vimキーバインド
bindkey -v

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct


# backspace,deleteキーを使えるように
stty erase ^H
stty erase ""
bindkey "^[[3~" delete-char


bindkey jj vi-cmd-mode

# どこからでも参照できるディレクトリパス
# cdpath=(~)

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
    zstyle ':zle:*' word-chars "_-./;@"
    zstyle ':zle:*' word-style unspecified

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# 複数ファイルのmv 例　zmv *.txt *.txt.bk
autoload -Uz zmv
alias zmv='noglob zmv -W'

# mkdirとcdを同時実行
function mkcd() {
    if [[ -d $1 ]]; then
        echo "$1 already exists!"
        cd $1
    else
        mkdir -p $1 && cd $1
    fi
}
. ~/.zshrc.local
