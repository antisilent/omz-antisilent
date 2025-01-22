# Custom git plugin because the official one knows too much.

alias g='git'
alias ga='git add'
alias gall='git add -A'
alias gap='git add -p'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbm='git branch -m'
alias gbt='git branch --track'
alias gc='git commit -v'
alias gca='git commit -v -a'
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
alias gcam="git commit -v -am"
alias gcb='git checkout -b'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gclean='git clean -fd'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpd='git checkout master; git pull; git branch -D'
alias gcpx='git cherry-pick -x'
alias gcsam="git commit -S -am"
alias gct='git checkout --track'
alias gd='git diff'
alias gdel='git branch -D'
alias gds='git diff --staged'
alias gdv='git diff -w "$@" | vim -R -'
alias get='git'
alias gexport='git archive --format zip --output'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gftv='git fetch --all --prune --tags --verbose'
alias gfv='git fetch --all --prune --verbose'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias ggui="git gui"
alias gh='cd "$(git rev-parse --show-toplevel)"'
alias gl='git pull'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias glum='git pull upstream master'
alias gm="git merge"
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gmv='git mv'
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
alias gp='git push'
alias gpatch="git format-patch -1"
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias gpristine='git reset --hard && git clean -dfx'
alias gpu='git push --set-upstream'
alias gpuo='git push --set-upstream origin'
alias gpuoc='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias gr='git remote'
alias gra='git remote add'
alias grm='git rm'
alias grv='git remote -v'
alias gs='git status'
alias gsl="git shortlog -sn"
alias gss='git status -s'
alias gst="git stash"
alias gstb="git stash branch"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gsu='git submodule update --init --recursive'
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
# Show untracked files
alias gu='git ls-files . --exclude-standard --others'
alias gup='git fetch && git rebase'
alias gus='git reset HEAD'
alias gwc="git whatchanged"

case $OSTYPE in
  darwin*)
    alias gtls="git tag -l | gsort -V"
    ;;
  *)
    alias gtls='git tag -l | sort -V'
    ;;
esac
