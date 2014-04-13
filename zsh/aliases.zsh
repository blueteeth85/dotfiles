alias reload!='. ~/.zshrc'

alias ls="/bin/ls -F --color"
alias l="/bin/ls -lAh --color"
alias ll="/bin/ls -l --color"
alias la="/bin/ls -A --color"

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
