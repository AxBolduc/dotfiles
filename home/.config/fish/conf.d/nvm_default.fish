# Shared default Node version for all shells (fish, zsh, bash, sh).
# Source of truth: ~/.config/shell/node-default-version
# Runs after conf.d/nvm.fish (alphabetical), so we activate it ourselves here for
# interactive AND non-interactive fish. `nvm use <x>` in a shell still overrides it.
if test -r ~/.config/shell/node-default-version
    set -gx nvm_default_version (string trim < ~/.config/shell/node-default-version)
end

functions -q nvm; or return

set --query nvm_data; or set --global nvm_data ~/.local/share/nvm

if set --query nvm_current_version; and test -d $nvm_data/$nvm_current_version/bin
    # Inherited from a parent shell (tmux pane, nested fish, editor terminal).
    # Login fish on macOS runs path_helper, which moves /usr/local/bin (system
    # node) ahead of the inherited nvm dir, so put it back in front.
    set --local bin $nvm_data/$nvm_current_version/bin
    set --local index (contains --index -- $bin $PATH); and set --erase PATH[$index]
    set --global --export --prepend PATH $bin
else if set --query nvm_default_version
    set --erase nvm_current_version
    nvm use --silent $nvm_default_version 2>/dev/null
end
