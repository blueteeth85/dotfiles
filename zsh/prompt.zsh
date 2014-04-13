autoload colors && colors

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

export PROMPT=$'$(directory_name) \n%# '
