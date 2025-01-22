#antisilent.zsh-theme
setopt prompt_subst

export CLICOLOR=1
export GREP_COLOR='0;45;37'
# export LSCOLORS=exgxdhdhfxDhDhhbhdhcae

safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

NEWLINE=$'\n'
UTOPLEFT="┌"              # ┌
UBAR="─"                  # ─
UBOTTOMLEFT="└"           # └
ULBRACK="["                       # [
URBRACK="]"                       # ]

PROMPT_CMD="[$]"

if [ -z ${PROMPT_COLOR+x} ]; then
    PROMPT_COLOR=$(tput setaf 4)
fi

ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="${UBAR}${ULBRACK}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}${URBRACK}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="${URBRACK}${UBAR}${ULBRACK}"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}%{✎%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[magenta]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[magenta]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{?%G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}%{⚑%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ─[\1]/'

userhost() {
   echo "%F{magenta}%n@%m%{$reset_color%}"
}

timedate() {
    echo "%F{green}$(date +"%Y.%m.%d @ %H:%M:%S")%{$reset_color%}"
}

currentdir() {
    echo "%F{cyan}%~%{$reset_color%}"
}

fileinfo() {
    echo "%F{cyan}$(ls -1 | wc -l | sed 's: ::g') files, $(ls -lah | grep -m 1 total | sed 's/total //')b%{$reset_color%}"
}

nodeversion() {
    echo "${UBAR}${ULBRACK}%F{cyan}node: $(nvm current)%{$reset_color%}${URBRACK}"
}

return_status() {
    echo "%(?..💀)"
}

conda_prompt_info() {
  [[ -n ${CONDA_DEFAULT_ENV} ]] || return
  echo "${UBAR}${ULBRACK}%F{cyan}conda: ${CONDA_DEFAULT_ENV:t:gs/%/%%}%{$reset_color%}${URBRACK}"
}

virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${UBAR}${ULBRACK}%F{cyan}venv: ${VIRTUAL_ENV:t:gs/%/%%}%{$reset_color%}${URBRACK}"
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Has the same effect as `conda config --set changeps1 false`
# - https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#determining-your-current-environment
# - https://conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html#precedence
export CONDA_CHANGEPS1=false

function prompt_command() {
    PROMPT="${NEWLINE}${UTOPLEFT}${ULBRACK}$(userhost)${URBRACK}${UBAR}${ULBRACK}$(timedate)${URBRACK}$(git_super_status)${NEWLINE}${UBOTTOMLEFT}${ULBRACK}$(currentdir)${URBRACK}$(conda_prompt_info)$(virtualenv_prompt_info)${NEWLINE}[$] "
    # PROMPT="${NEWLINE}${UTOPLEFT}${ULBRACK}$(userhost)${URBRACK}${UBAR}${ULBRACK}$(timedate)${URBRACK}$(git_super_status)${NEWLINE}${UBOTTOMLEFT}${ULBRACK}$(currentdir)${URBRACK}${UBAR}${ULBRACK}$(fileinfo)${URBRACK}${UBAR}${ULBRACK}$(conda_prompt_info)${URBRACK}${NEWLINE}[$] "
    # PROMPT="${NEWLINE}${UTOPLEFT}${ULBRACK}$(userhost)${URBRACK}${UBAR}${ULBRACK}$(timedate)${URBRACK}$(git_super_status)${NEWLINE}${UBOTTOMLEFT}${ULBRACK}$(currentdir)${URBRACK}${UBAR}${ULBRACK}$(fileinfo)${URBRACK}${UBAR}${ULBRACK}$(nodeversion)${URBRACK}${NEWLINE}[$] "
    # PROMPT="${NEWLINE}${UTOPLEFT}${ULBRACK}$(userhost)${URBRACK}${UBAR}${ULBRACK}$(timedate)${URBRACK}$(git_prompt_info)${NEWLINE}${UBOTTOMLEFT}${ULBRACK}$(currentdir)${URBRACK}${UBAR}${ULBRACK}$(fileinfo)${URBRACK}${UBAR}${ULBRACK}$(nodeversion)${URBRACK}${NEWLINE}[$] "
    RPROMPT="$(return_status)"
}

precmd_functions+=prompt_command
