#!/bin/bash

# This script uses `stow`, but the author of `stow` would say it misuses `stow`.
# `stow` never deletes a file that it isn't sure it is responsible for.
# This script explicitly changes that policy, and instead assumes that
# the script is being used to provision a new system and will need to replace
# files that are installed in the base system.

# The script should only be used in controlled cases like creating a Docker container.

# The location of the git repo.
DOTFILES="${HOME}/dotfiles"

# The target for the packages. For now, must be home dir
TARGET="${HOME}"

for pkg in git bash local; do
    for file in $(ls -1A "${DOTFILES}/${pkg}"); do
        rm -rf ${TARGET}/$file
    done

    stow --dir="${DOTFILES}" --target="${TARGET}" "${pkg}"
done
