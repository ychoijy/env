if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

if [[ -x "$(command -v gls)" ]]; then
    alias ls='gls --color=auto'
    if [[ -x "$(command -v gdircolors)" ]]; then
        eval "$(gdircolors -b)"
    fi
fi
