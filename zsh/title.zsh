case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%m \a"}
        ;;
esac