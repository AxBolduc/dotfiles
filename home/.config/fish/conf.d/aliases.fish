status is-interactive; or return

command -q eza; and alias ls eza

# Abbreviations expand before running, so history shows the real command.
abbr -a lg lazygit
abbr -a gpf git push --force-with-lease
abbr -a awsl aws --profile localstack
abbr -a cff nvim ~/.config/fish/config.fish
abbr -a cfz nvim ~/.zshrc
abbr -a cfn 'cd ~/.config/nvim && nvim .'
