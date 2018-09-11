#############
# aliases
#############

alias acp=git_add_commit_push
alias rei=pip_reinstall

#############
# functions
#############

# git add/commit/push
git_add_commit_push () {
    set -x

    git add *
    git commit -m "$*"
    git push

    set +x
}

# pip reinstall
pip_reinstall() {
    set -x

    git pull
    sudo python setup.py install

    set +x
}
