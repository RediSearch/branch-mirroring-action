#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add codecommit codecommit::us-east-2://ldcore-demo-1
git remote set-url codecommit "$INPUT_TARGET_REPO_URL"
push -u codecommit codecommit-demo-1:main --force

# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
