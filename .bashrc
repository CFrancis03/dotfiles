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

# Creates a new note file
nn() {
    if [ -z "$1" ]; then
        echo "Usage: nn <new_filename>"
        return 1
    fi
    cp ~/Desktop/template/notes/template.md "$PWD/$1"
}

# Creates a new note index 

ni() {
    cp ~/Desktop/template/notes/index.md "$PWD/index.md"
}

# Creates a template flake.nix
fl() {
    cp ~/Desktop/template/flake/flake.nix "$PWD/flake.nix"
}

# Alias

alias off='shutdown -h now'
alias c='clear'
alias nrs='sudo nixos-rebuild switch --flake /etc/nixos/.#colton --upgrade'
alias turing='ssh z2030517@turing.cs.niu.edu'
alias shell='nix-shell'
alias edc='sudo nvim /etc/nixos/configuration.nix'
alias gc='nix-collect-garbage'
alias ns='nvim index.md'

# Set terminal into vi mode

set -o vi
