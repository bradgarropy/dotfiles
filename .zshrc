#############
# aliases
#############

alias gitacp=git_add_commit_push
alias gitf="git fetch --prune"
alias ghrv="gh repo view --web"
alias ghrc="gh repo create --web"
alias ghpr="gh pr create --web"

#############
# functions
#############

# git add/commit/push
git_add_commit_push() {
    set -x

    git add .
    git commit -m "$*"
    git push

    set +x
}

#############
# paths
#############

# homebrew
export PATH=$PATH:/opt/homebrew/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
