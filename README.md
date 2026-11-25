# dotfiles

Config lives in `home/` (mirrors `~`, symlinked with GNU Stow), packages in
`packages/`, and the `dot` CLI in `dot/` ([how it works](dot/README.md)).

```bash
git clone https://github.com/AxBolduc/dotfiles.git ~/.dotfiles
~/.dotfiles/dot/bin/dot init
~/.dotfiles/dot/bin/dot link   # put dot on PATH
```

`dot` is adapted from [dmmulroy/.dotfiles](https://github.com/dmmulroy/.dotfiles).
