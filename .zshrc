# 色を使用
#autoload -Uz colors
#colors
autoload colors
colors
PROMPT="%{$fg[green]%}%m%(!.#.$) %{$reset_color%}"
#PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
#SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

#PROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


# エイリアス
alias pip3_update_all='pip3 freeze --local | grep -v "^\-e" | cut -d = -f 1 | xargs pip3 install -U'
alias lst='ls -ltr -G'
alias l='ls -ltr -G'
alias la='ls -la -G'
alias ll='ls -l -G'
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias ssh-config-update="cat ~/.ssh/conf.d/common-config ~/.ssh/conf.d/*.conf > ~/.ssh/config"
alias jl='/Users/suzukiry/lab/config/jupyterrun.command'
alias p3='source /Users/suzukiry/lab/virtualenv/dev/bin/activate'
alias hadoop='source /Users/suzukiry/lab/virtualenv/hadoop/bin/activate'
alias ju='/Users/suzukiry/lab/config/jupyterrun_local.command'


#User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

#zsh-completions

autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

