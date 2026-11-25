# Exported variables, for interactive and non-interactive shells.
set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'

# Trust the macOS keychain's CAs (Zscaler) instead of disabling TLS checks.
set -gx NODE_USE_SYSTEM_CA 1

set -gx BUN_INSTALL $HOME/.bun
test (uname) = Darwin; and set -gx PNPM_HOME $HOME/Library/pnpm; or set -gx PNPM_HOME $HOME/.local/share/pnpm
test -d $HOME/Library/Android/sdk; and set -gx ANDROID_HOME $HOME/Library/Android/sdk
