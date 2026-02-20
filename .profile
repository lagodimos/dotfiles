# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

export VISUAL="nano"
export EDITOR="$VISUAL"
export ESCALATION_TOOL="sudo"
export TERMINAL="app.devsuite.Ptyxis"
export GUI_EDITOR="dev.zed.Zed"
export FILE_MANAGER="org.kde.dolphin"
export BROWSER="org.mozilla.firefox"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.scripts" ] ; then
    export PATH="$HOME/.scripts:$PATH"
fi
