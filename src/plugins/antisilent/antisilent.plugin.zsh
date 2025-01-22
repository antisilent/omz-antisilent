# Custom functions
function pathmunge () {
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
      if [ "$2" = "after" ] ; then
        PATH=$PATH:$1
      else
        PATH=$1:$PATH
      fi
  fi
}

function zconf() {
  code ~/{.z{sh{rc,env},profile,login,logout},.oh-my-zsh}
}


# Add custom $PATHs
_paths=(
  $HOME/bin
)

for p in ${_paths[@]}; do
  pathmunge "${p}"
done

pathmunge ""

alias rezsh="omz reload"

# overrides
alias vi="vim"
