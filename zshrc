# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/anurag.d/.zshrc'
autoload -U colors && colors
autoload -U compinit
compinit -i

# End of lines added by compinstall
# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
unsetopt LIST_AMBIGUOUS
setopt  COMPLETE_IN_WORD

# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

# Egomaniac!
zstyle ':completion:*' list-separator 'fREW'

# complete with a menu for xwindow ids
zstyle ':completion:*:windows' menu on=0
zstyle ':completion:*:expand:*' tag-order all-expansions

# more errors allowed for large words and fewer for small words
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'

# Errors format
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'

# Don't complete stuff already on the line
zstyle ':completion::*:(rm|vi):*' ignore-line true

# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd

zstyle ':completion::approximate*:*' prefix-needed false

#{{{ History Stuff

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#}}}
#{{{ Prompt!

host_color=cyan
history_color=yellow
user_color=green
root_color=red
directory_color=magenta
error_color=red
jobs_color=green

host_prompt="%{$fg_bold[$host_color]%}%m%{$reset_color%}"

jobs_prompt1="%{$fg_bold[$jobs_color]%}(%{$reset_color%}"

jobs_prompt2="%{$fg[$jobs_color]%}%j%{$reset_color%}"

jobs_prompt3="%{$fg_bold[$jobs_color]%})%{$reset_color%}"

jobs_total="%(1j.${jobs_prompt1}${jobs_prompt2}${jobs_prompt3} .)"

history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"

history_prompt2="%{$fg[$history_color]%}%h%{$reset_color%}"

history_prompt3="%{$fg_bold[$history_color]%}]%{$reset_color%}"

history_total="${history_prompt1}${history_prompt2}${history_prompt3}"

error_prompt1="%{$fg_bold[$error_color]%}<%{$reset_color%}"

error_prompt2="%{$fg[$error_color]%}%?%{$reset_color%}"

error_prompt3="%{$fg_bold[$error_color]%}>%{$reset_color%}"

error_total="%(?..${error_prompt1}${error_prompt2}${error_prompt3} )"

case "$TERM" in
  (screen)
    function precmd() { print -Pn "\033]0;S $TTY:t{%100<...<%~%<<}\007" }
  ;;
  (xterm)
    directory_prompt=""
  ;;
  (*)
    directory_prompt="%{$fg[$directory_color]%}%~%{$reset_color%} "
  ;;
esac

if [[ $USER == root ]]; then
    post_prompt="%{$fg_bold[$root_color]%}%#%{$reset_color%}"
else
    post_prompt="%{$fg_bold[$user_color]%}%#%{$reset_color%}"
fi
MYSHELL=$(ps -p $$ -ocomm= 2>/dev/null)

#PS1="${host_prompt} ${jobs_total}${history_total} ${directory_prompt}${error_total}${post_prompt} "
[[ $UID -eq 0 ]] && color=red || color=magenta
#NEWLINE=$'\n'
PROMPT="${NEWLINE}[%{$fg_bold[blue]%}${MYSHELL}%{$reset_color%}:%{$fg_bold[${color}]%}%n@%M%{$reset_color%}] %{$fg_bold[green]%}%c%{$reset_color%} %# "

alias rm='rm'
alias touchenable="xinput| grep -i touchpad | awk '{print $7}' | cut -d = -f 2 | xargs xinput enable"
alias decrypt='sudo cryptsetup open --type luks /dev/loop0 root;sudo mount /dev/mapper/root /mnt'
alias encrypt='sudo umount /mnt;sudo cryptsetup close root'
alias t='tmux'
alias diff='colordiff'
alias l='ls -Alhr --color'
alias ls='ls --color'
alias say='figlet -f script'
alias evil='cowsay -f /usr/share/cowsay/cows/daemon.cow'
alias mv='mv -i'
alias super='sudo sudo su -'
alias gomu='sudo /sbin/ip a'
alias luff='ssh root@95.85.45.177 -D 9999'
alias tmux="TERM=screen-256color-bce tmux"
alias powerdown="echo 700000 | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;echo 1000000 | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"
alias powerup="echo 2400000 | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;echo 2400000 | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq"

#if [[ $TERM == screen]; then
     #function precmd() {
          #print -Pn "\033]0;S $TTY:t{%100<...<%~%<<}\007"
             #}
#elsif [[ $TERM == linux ]]; then
    #precmd () { print -Pn "\e]0;%m: %~\a" }
#fi

#}}}


