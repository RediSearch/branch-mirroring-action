#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
# git remote add -m "$INPUT_TARGET_REPO_URL"
git remote set-url origin "$INPUT_TARGET_REPO_URL"
git config --local user.name actions-user
git config --local user.email "actions@github.com"
git commit -m "initial commit"
git push -u origin main --force

# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
