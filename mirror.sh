#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add origin3 ssh://git-codecommit.us-east-2.amazonaws.com/v1/repos/ldcore-demo-1

git push origin3 codecommit-demo-1:main --force

# NOTE: Since `post` execution is not supported for local action from './' for now, we need to
# run the command by hand.
/cleanup.sh mirror
