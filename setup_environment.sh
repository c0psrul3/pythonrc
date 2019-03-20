#!/usr/bin/env bash

: ${PYTHON_HISTORY_FILE:=$HOME/.python/python_history}
: ${PYTHONSTARTUP:="~/.python/pythonrc.py"}
: ${_PY_COLOR_SCHEME:=default}
: ${_PY_HIST_LENGTH:=1000}
: ${VIRTUALENVWRAPPER_PYTHON:=/usr/bin/python3.4}
_VIRTUALENVWRAPPER_SCRIPT='$(which virtualenvwrapper.sh)'

: ${WORKON_HOME:=~/.python/virtualenvs}

## Create Pythonrc directory
mkdir -p $(dirname ${PYTHON_HISTORY_FILE})
touch ${PYTHON_HISTORY_FILE}


tee -a .bashrc <<PYTHONRC
# python
export PYTHONSTARTUP=${PYTHONSTARTUP}
export PYTHON_HISTORY_FILE=${PYTHON_HISTORY_FILE}

## You may want to also uncomment some of this lines if using and old
## version of virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON=${VIRTUALENVWRAPPER_PYTHON}
# export WORKON_HOME=${WORKON_HOME}
# source ${_VIRTUALENVWRAPPER_SCRIPT}
PYTHONRC


tee -a ~/.config/bpython/config <<BPYCONFIG
[general]
color_scheme = ${_PY_COLOR_SCHEME}
hist_file = ${PYTHON_HISTORY_FILE}
hist_length = ${_PY_HIST_LENGTH}
BPYCONFIG

if [[ -e $(dirname $0)/pythonrc.py ]] ; then
  cp $(dirname $0)/pythonrc.py ${PYTHONSTARTUP}
fi


