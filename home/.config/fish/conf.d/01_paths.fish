# PATH, rebuilt every start (--global) so nothing depends on fish_variables.
# Runs before nvm*.fish, which puts the active Node first. fish_add_path skips
# directories that do not exist. First in the list wins.
fish_add_path --global --move \
    $PNPM_HOME/bin \
    "$HOME/Library/Application Support/Coursier/bin" \
    $HOME/.maestro/bin \
    $HOME/.cargo/bin \
    $HOME/go/bin \
    $PNPM_HOME \
    $BUN_INSTALL/bin \
    $HOME/.local/bin \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/arm-none-eabi-gcc@8/bin \
    /opt/homebrew/opt/arm-none-eabi-gcc@9/bin \
    $HOME/.config/emacs/bin \
    $HOME/Applications/Ghostty.app/Contents/MacOS
fish_add_path --path --append $HOME/.docker/bin
