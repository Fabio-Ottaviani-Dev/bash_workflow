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

# Sublime Text
# alias subl="/Applications/Sublime\\ Text.app/Contents/SharedSupport/bin/subl"

# SciTE
alias scite="open -a SciTE"

# Atom
# https://stackoverflow.com/questions/22390709/how-to-open-atom-editor-from-command-line-in-os-x/23666354#23666354

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

# composer
# alias composer="/usr/local/bin/composer"
# export PATH=~/.composer/vendor/bin:$PATH

# composer-update()
# {
# 	currentDir="$PWD"
# 	cd ~/.composer/ || exit
# 	composer clear-cache
# 	composer self-update
# 	composer update
	# composer global require "laravel/installer"
# 	cd "$currentDir" && clear
# }

# Homebrew
PATH=$(brew --prefix)/bin:$PATH

# Node npm
export PATH=/usr/local/bin/npm:$PATH

# -------------------------------------------------------------------------------------
# Python
# -------------------------------------------------------------------------------------

# Setting PATH for Python 3.7.3
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7.3/bin:${PATH}"
# export PATH

# -------------------------------------------------------------------------------------
# Ubuntu virtual machine
# -------------------------------------------------------------------------------------

# alias ububu="vagrant box update && vagrant up && vagrant ssh"

# -------------------------------------------------------------------------------------
# include
# -------------------------------------------------------------------------------------

# Test script
# source ~/bash_workflow/_test.bash

# MAMP workflow
source ~/bash_workflow/mamp_workflow.bash

# Laravel workflow
# source ~/bash_workflow/laravel_workflow.bash

# Flask workflow
source ~/bash_workflow/flask_workflow.bash

# -------------------------------------------------------------------------------------
