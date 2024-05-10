# Enable colors and change prompt:
autoload -U colors && colors

# Load git plugin for git prompt info
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt PROMPT_SUBST

# Define PS1 with Git branch information enclosed in parentheses
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[green]%}(%{$fg[red]%}\$vcs_info_msg_0_%{$fg[green]%})%{$fg[red]%}]%{$reset_color%}%b "
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# vi mode

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
export TERMINFO="/usr/share/terminfo"
# Load conda
source /opt/miniconda3/bin/activate base
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

