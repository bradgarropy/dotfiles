#############
# aliases
#############

alias gitacp=git_add_commit_push
alias gitf="git fetch --prune"
alias gho="gh repo view -w"
alias ghpr="gh pr create -w"
alias ghr=github_new_repo
alias ntlo="netlify open"
alias ntld="netlify dev"
alias rei=pip_reinstall
alias remage=magento_restart

#############
# functions
#############

# new github repo
github_new_repo() {
    set -x

    gh repo create $1 --public
    cd $1
    labman bradgarropy/labels bradgarropy/$1 --clobber
    gh repo view -w
    code -r .

    set +x
}


# git add/commit/push
git_add_commit_push() {
    set -x

    git add .
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

# magento restart
magento_restart() {
    set -x

    cd ~/projects/magento2ce
    rm -rf var/di/* var/generation/* var/cache/* var/log/* var/page_cache/*
    php bin/magento cache:clean
    php bin/magento cache:flush
    php bin/magento setup:upgrade
    php bin/magento setup:di:compile
    php bin/magento indexer:reindex
    cd -

    set +x
}
