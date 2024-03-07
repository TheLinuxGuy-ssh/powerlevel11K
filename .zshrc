# Aliases

# alias ls="exa"
# alias la="exa -al"
# alias lp="exa -alh"
alias clear="clear && exec zsh"

# Welcome Message

echo "\e[43m\e[0;37mWelcome Back \e[1;32m<Your name here>\e[0;37m!"

# ZSH Theme & Plugins

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    web-search
)

# ZSH_THEME="common"

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
