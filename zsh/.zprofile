eval "$(/opt/homebrew/bin/brew shellenv)"

# docker config for podman
# export DOCKER_HOST="/Users/quentin.vaucher/.local/share/containers/podman/machine/qemu/podman.sock"
export TESTCONTAINERS_RYUK_DISABLED="true"

# set the contianer user to PODMAN_USER when the container
# need to write in a mounted folder as a volume
export PODMAN_USER="$(id -u):$(id -g)"

# used by intellij to download maven artifacts from github
export GITHUB_ACTOR=QuentinVaucherLeanIX
export GITHUB_TOKEN=<SomeGithubTokenHere>


# Created by `pipx` on 2024-05-29 07:12:07
export PATH="$PATH:/Users/quentin.vaucher/.local/bin"
