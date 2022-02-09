#Import the Aliases from the Alias file
ALIASFILE=$HOME/.zshaliases

if test -f "$ALIASFILE"; then
    source $ALIASFILE
fi

#Import Prompt
PROFILE=$HOME/.zshprompt

if test -f "$PROFILE"; then
    source $PROFILE;
fi

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

zstyle ':vcs_info:git:*' formats "%F{160}%s:(%F{208}%b%F{160}) "

setopt PROMPT_SUBST

if test -d "$HOME/bin/"; then
    for file in $HOME/bin/**/*; do
        source $file;
    done
fi

export TERM=xterm-256color 

#Custom Prompt
#→ [Current Folder] [git info] $
PROMPT='%F{214}%m %B%(?.%F{82}→.%F{1}→) %F{75}%1~ ${vcs_info_msg_0_}%F{15}$ %b'
