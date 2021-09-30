#!/bin/bash

set -euo pipefail
## This script launches the build-agent using systemd-run in order to create a
## cgroup which will capture all child processes so they're cleaned up correctly
## on exit.

# The user to run the build-agent as - must be numeric
# USER_ID=$(id -u circleci)

# Give the transient systemd unit an inteligible name
# unit="circleci-$CIRCLECI_LAUNCH_ID"

sudo -H -u circleci "$@"
# When this process exits, tell the systemd unit to shut down
# abort() {
#   systemctl stop "$unit"
# }
# trap abort EXIT

# systemd-run \
#     --pipe --collect --quiet --wait \
#     --uid "$USER_ID" --unit "$unit" -- "$@"