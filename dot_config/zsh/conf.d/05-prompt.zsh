# Prompt configuration
# From dot.zsh/default.sh

autoload colors
colors
setopt prompt_subst

case ${UID} in
0)
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
  PROMPT=$'%B%{\e[36m%}[%n@%m]#%{\e[m%}%b '
  PROMPT2=$'%B%{\e[31m%}%_#%{\e[m%}%b '
  RPROMPT=$'%{\e[36m%}(`rprompt_git_current_branch`%{\e[36m%}%~%)%{\e[m%}'
  SPROMPT=$'%B%{\e[31m%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b '
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT=$'%{\e[36m%}[%n@%m]%%%{\e[m%} '
  PROMPT2=$'%{\e[31m%}%_%%%{\e[m%} '
  RPROMPT=$'%{\e[36m%}(`rprompt_git_current_branch`%{\e[36m%}%~%)%{\e[m%}'
  SPROMPT=$'%{\e[31m%}%r is correct? [n,y,a,e]:%{${reset_color}%} '
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac
