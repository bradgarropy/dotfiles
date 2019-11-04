#############
# aliases
#############

alias acp=git_add_commit_push
alias rei=pip_reinstall
alias remage=magento_restart
alias neto="netlify open"
alias hubo="hub browse --"
alias hubi="hub browse -- issues"

#############
# functions
#############

# git add/commit/push
git_add_commit_push() {
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
