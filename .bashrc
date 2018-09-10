# .bashrc


#############
# aliases
#############

alias acp=git_acp
alias pre=pip_re


#############
# functions
#############

# git add/commit/push
git_acp () {
    echo $@
}

# pip reinstall
pip_re() {
    git pull
    sudo python setup.py install
}
