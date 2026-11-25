# Git submodules under home/ (opencode/superpowers). `git pull` and a plain
# clone do not fetch them, and stowed symlinks point into them.
__define_component submodules all optional "Git submodules"

component_submodules_install() {
    git -C "$DOTFILES_DIR" submodule update --init --recursive
}

component_submodules_check() {
    __doctor_check --warn --hint "run: ${SCRIPT_NAME} init --only submodules" "Git submodules are checked out" __submodules_are_present
}

# Uninitialized submodules start with "-" in `git submodule status`.
__submodules_are_present() {
    local submodule_status
    submodule_status="$(git -C "$DOTFILES_DIR" submodule status)" || return 1
    ! grep -q '^-' <<< "$submodule_status"
}
