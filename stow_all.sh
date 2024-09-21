#!/bin/bash


# The location of the git repo.
DOTFILES="${HOME}/dotfiles"

# The target for the packages. For now, must be home dir
TARGET="${HOME}"

for pkg in git bash; do
    for file in $(ls -1A "${DOTFILES}/${pkg}"); do
        rm ${TARGET}/$file
    done

    stow --dir="${DOTFILES}" --target="${TARGET}" "${pkg}"
done
