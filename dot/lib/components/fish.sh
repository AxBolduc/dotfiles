# Fish plugins in fish_plugins, through Fisher. Fisher writes plugin files into
# ~/.config/fish (real directories, see STOW_SHARED_DIRECTORIES), not the repo.
__define_component fish all optional "Fish plugins"

FISHER_RELEASE_VERSION="4.4.8"

component_fish_install() {
    if ! __command_exists fish; then
        __print_error "Fish is not installed (run: ${SCRIPT_NAME} init --only packages)"
        return 1
    fi
    if fish -c "type -q fisher"; then
        # fisher update rewrites plugins; only `dot update` upgrades them.
        __print_success "Fisher is already installed"
        return 0
    fi
    # Source a temp copy: a fisher.fish already in place conflicts with the
    # jorgebucaran/fisher entry, and Fisher would drop it from fish_plugins.
    local fisher_file status=0
    fisher_file="$(mktemp)"
    if __download_url "https://raw.githubusercontent.com/jorgebucaran/fisher/${FISHER_RELEASE_VERSION}/functions/fisher.fish" "$fisher_file"; then
        fish -c "source '${fisher_file}'; and fisher update" </dev/null || status=1
    else
        status=1
    fi
    rm -f "$fisher_file"
    return "$status"
}

component_fish_update() {
    fish -c "fisher update" </dev/null || return 1
}

component_fish_check() {
    __doctor_check --warn --hint "run: ${SCRIPT_NAME} init --only fish" "Fisher is installed" fish -c "type -q fisher"
}
