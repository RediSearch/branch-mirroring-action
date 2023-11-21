#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add upstream "$INPUT_TARGET_REPO_URL"
# git push --tags --force --prune mirror "refs/remotes/origin/*:refs/heads/*"
git push -u upstream $INPUT_SOURCE_BRANCH_ID:main
# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
