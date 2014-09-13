function on_mac {
    if [ `uname` == 'Darwin' ]
    then
	return 0
    fi
    return 1
}

function echo_if_interactive {
    if is_interactive_shell
    then
	echo "$*"
    fi
}

function is_interactive_shell {
    if [ "x$PS1" != "x" ]
    then
	return 0
    fi
    return 1
}

function real_path {
    if which perl > /dev/null 2>&1
    then
	perl -e 'use Cwd qw(abs_path); print abs_path($ARGV[0]);' "$1"
    elif which -s python
    then
	python -c "import os,sys; print os.path.realpath(sys.argv[1])"  "$1"
    else
	echo real_path: neither perl not python area available >&2
	echo "$1"
    fi
}

function source_if_exists {
    local FILE=$1
    if [ -f "$FILE" ]
    then
	source "$FILE"
    fi
}
