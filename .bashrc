parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\e[31m\W\e[0;33m\$(parse_git_branch) \e[0;31m$ \e[0m"