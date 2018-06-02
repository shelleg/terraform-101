#!/usr/bin/env bash

function validate_homebrew() {
  which brew &>/dev/null
  if [ "$?" -ne 0 ]; then
    printf "
      seems like hombrew isn't intalled please install and rerun $0\n
      if your living on the edge ..., you can always:\n
      /usr/bin/ruby -e \$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\n
    "
  fi
}

function install_terraform() {
  which terraform &>/dev/null || brew install terraform
}
