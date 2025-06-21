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
