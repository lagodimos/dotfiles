#!/bin/bash

if [ -f /home/$USER/.profile ]; then
    source /home/$USER/.profile
fi

export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend

shopt -s autocd

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Prompt
PS1="\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;36m\]\w\[\033[0m\]\$ "

# Aliases

alias pd='cd "$OLDPWD"'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'

alias mx='chmod a+x'

# uutils
uu_binaries=$(compgen -c | grep '^uu-')
for binary in $uu_binaries; do
    command="${binary#uu-}"
    alias $command=$binary
done
unalias [ # workaround: dont use uu-[, breaks git add completions

up ()   # Goes up a specified number of directories  (i.e. up 4)
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

hh () {     # History Search
    history -d $((HISTCMD-1))

    command=$(cat -n $HISTFILE | tac | sort -uk2 | sort -nk1 | cut -f2- | fzf --tac)

    if [[ -n "$command" ]]; then

        # Allow editing
        read -e -r -p "${PS1@P}" -i "$command" command

        if [[
            -n "$HISTFILE" &&
            -n "$command" &&
            "$command" != "$FUNCNAME" &&
            "$command" != "$FUNCNAME "* &&
            ! (
                ("$HISTCONTROL" == *"ignoreboth"* || "$HISTCONTROL" == *"ignoredups"*) &&
                "$command" == $(tail -1 $HISTFILE)
            )
        ]]; then
            echo "$command" >> $HISTFILE
        fi

        eval "$command"
    fi

    unset command
}

bkg () {
    nohup $@ > /dev/null 2>&1 &
}

governor () {
    $ESCALATION_TOOL cpupower frequency-set -g $1
}

_governor () {
    if [[ ${#COMP_WORDS[@]} -gt 2 ]]; then
        COMPREPLY=()
    else
        governors=$(cpupower frequency-info --governors | tail -1 | cut -d ':' -f 2-)
        COMPREPLY=($(compgen -W "$governors" -- "${COMP_WORDS[1]}"))
    fi
}

complete -F _governor governor

### Rust ###

if [[ -d $HOME/.cargo/bin ]]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

install_rustup () {
    if [[ ! -f "/home/$USER/.cargo/bin/rustup" ]]; then
        sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y --no-modify-path;
    fi
}

if flatpak info dev.zed.Zed &> /dev/null; then
    alias zed='flatpak run dev.zed.Zed'
fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd j bash)"
fi
