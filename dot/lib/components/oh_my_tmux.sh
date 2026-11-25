# oh-my-tmux (gpakosz/.tmux): its .tmux.conf is ~/.config/tmux/tmux.conf; my
# settings are the stowed tmux.conf.local. The link is made here because it is
# absolute, and stow aborts on absolute symlinks.
__define_component oh_my_tmux all optional "oh-my-tmux"

OH_MY_TMUX_REPO_URL="https://github.com/gpakosz/.tmux.git"

__oh_my_tmux_dir() {
    printf '%s\n' "${XDG_DATA_HOME:-${HOME}/.local/share}/tmux/oh-my-tmux"
}

component_oh_my_tmux_install() {
    local clone_dir link_path="${HOME}/.config/tmux/tmux.conf"
    clone_dir="$(__oh_my_tmux_dir)"
    if [[ ! -d "$clone_dir" ]]; then
        git clone --single-branch "$OH_MY_TMUX_REPO_URL" "$clone_dir" || return 1
    fi
    if [[ -e "$link_path" && ! -L "$link_path" ]]; then
        __print_error "Refusing to replace ${link_path}: it is not a symlink"
        return 1
    fi
    mkdir -p "$(dirname "$link_path")"
    ln -sfn "${clone_dir}/.tmux.conf" "$link_path" || return 1
    __print_success "oh-my-tmux is linked at ${link_path}"
}

component_oh_my_tmux_check() {
    __doctor_check --warn --hint "run: ${SCRIPT_NAME} init --only oh_my_tmux" \
        "tmux.conf resolves" test -e "${HOME}/.config/tmux/tmux.conf"
}
