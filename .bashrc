rm ~/.config/fish/functions/fish_prompt.fish &> /dev/null
omf theme agnoster &> /dev/null

# Set-up the enviroment script
. "$HOME/.enviroment"

# Set-up the terminal
exec fish
