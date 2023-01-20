rm ~/.config/fish/functions/fish_prompt.fish &> /dev/null
omf theme agnoster &> /dev/null
export VISUAL=vim
export EDITOR=vim
. "$HOME/.cargo/env"
exec fish
