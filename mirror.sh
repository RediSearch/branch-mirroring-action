#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add codecommit "$INPUT_TARGET_REPO_URL"
git push codecommit codecommit-demo-1:main --force

# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
