
# cd x allows us to move back x directories

cd () {
    if [[ $# -eq 0 ]]; then
        builtin cd
        return
    fi
    if [[ $1 =~ ^[0-9]+$ ]]; then
        local levels=$1
        local path=""
        for ((i=0; i<levels; i++)); do
            path+="../" 
        done
        builtin cd "$path"
    else
        builtin cd "$1"
    fi
}




# Alias

alias off='shutdown -h now'
alias c='clear'
alias nrs='sudo nixos-rebuild switch'
alias vim='nvim'
alias turing='ssh z2030517@turing.cs.niu.edu'
alias shell='nix-shell'
alias edc='sudo nvim /etc/nixos/configuration.nix'
alias nb="nix-build"

# Set terminal into vi mode

set -o vi
