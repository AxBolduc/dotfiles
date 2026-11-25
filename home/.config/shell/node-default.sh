# Shared default-Node setup for every POSIX shell (sh, bash, zsh).
# The default version lives in ~/.config/shell/node-default-version and the
# installs are managed by nvm.fish (~/.local/share/nvm), so fish and every other
# shell resolve to the same binary. Change the default by editing that file
# (or by running `nvm install <version>` in fish for something new).
#
# Accepts what nvm.fish accepts: "lts/<codename>", "lts", "latest", "v24", "24.22.3".
# Picks the newest *installed* version that matches.

__nd_data="${nvm_data:-${XDG_DATA_HOME:-$HOME/.local/share}/nvm}"
__nd_want=""
[ -r "$HOME/.config/shell/node-default-version" ] &&
  read -r __nd_want < "$HOME/.config/shell/node-default-version"

if [ -n "$__nd_want" ] && [ -d "$__nd_data" ]; then
  __nd_ver=""
  case "$__nd_want" in
    lts/*|lts|latest)
      # .index is newest-first: "<version> <lts/codename|latest|->"
      if [ -r "$__nd_data/.index" ]; then
        case "$__nd_want" in
          lts) __nd_pat='lts/' ;;
          *)   __nd_pat="$__nd_want" ;;
        esac
        while read -r __nd_v __nd_alias; do
          case "$__nd_alias" in
            "$__nd_pat"*) [ -x "$__nd_data/$__nd_v/bin/node" ] && { __nd_ver="$__nd_v"; break; } ;;
          esac
          # "latest" only tags one entry; fall back to newest installed
          [ "$__nd_want" = latest ] && [ -x "$__nd_data/$__nd_v/bin/node" ] && { __nd_ver="$__nd_v"; break; }
        done < "$__nd_data/.index"
      fi
      ;;
    *)
      # explicit version or prefix, e.g. "24" or "v24.22": newest installed match
      __nd_pfx="v${__nd_want#v}"
      __nd_ver=$(ls -1 "$__nd_data" 2>/dev/null |
        grep -E "^$(printf '%s' "$__nd_pfx" | sed 's/\./\\./g')(\.|\$)" |
        sort -t. -k1.2,1n -k2,2n -k3,3n | tail -n 1)
      [ -n "$__nd_ver" ] && [ ! -x "$__nd_data/$__nd_ver/bin/node" ] && __nd_ver=""
      ;;
  esac

  if [ -n "$__nd_ver" ]; then
    __nd_bin="$__nd_data/$__nd_ver/bin"
    case ":$PATH:" in
      ":$__nd_bin:"*) ;;                      # already first
      *) PATH="$__nd_bin:$PATH" ;;
    esac
    export PATH
  fi
fi

unset __nd_data __nd_want __nd_ver __nd_pat __nd_v __nd_alias __nd_pfx __nd_dir __nd_bin
