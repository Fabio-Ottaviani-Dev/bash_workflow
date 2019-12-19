#!/bin/bash

# -------------------------------------------------------------------------------------
# Git
# -------------------------------------------------------------------------------------

# Git, Enable tab completion
source ~/bash_workflow/git_completion.bash

# colors!
green="\\[\\033[0;32m\\]"
blue="\\[\\033[0;34m\\]"
purple="\\[\\033[0;35m\\]"
reset="\\[\\033[0m\\]"

# Git, clone and cd into
gclonecd()
{
  git clone "$1" && cd "$(basename "$1")"
}

# Change command prompt
source ~/bash_workflow/git_prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\\u$green\$(__git_ps1)$blue \\W $ $reset"

# -------------------------------------------------------------------------------------
# Editor
# -------------------------------------------------------------------------------------

# SciTE
alias scite="open -a SciTE"

# -------------------------------------------------------------------------------------
# Utility
# -------------------------------------------------------------------------------------

# super ls
alias sls="clear && ls -Galh"

alias off="sudo shutdown -h now"

# Edit .bash_profile and scripts
alias bp-edit="atom ~/bash_workflow/ & subl ~/bash_profile"

# Reload .bash_profile
alias bp-reload="source ~/.bash_profile && clear"

# -------------------------------------------------------------------------------------
# Dev Tools Conf
# -------------------------------------------------------------------------------------

# Homebrew
PATH=$(brew --prefix)/bin:$PATH

# Node npm
export PATH=/usr/local/bin/npm:$PATH

# -------------------------------------------------------------------------------------
# include
# -------------------------------------------------------------------------------------

# MAMP workflow
source ~/bash_workflow/mamp_workflow.bash

# Flask workflow
source ~/bash_workflow/flask_workflow.bash

# -------------------------------------------------------------------------------------
