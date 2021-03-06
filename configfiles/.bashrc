# ---B--------------B---------------------------------------B--------------B--- #
# ---------------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------------- #
# ---A--------------A--- S       A     A G       E       ---A--------------A--- #
# ---------------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------------- #
# ---S--------------S---       S A     A G     G E       ---S--------------S--- #
# ---------------------- SSSSSSS A     A GGGGGGG EEEEEEE ---------------------- #
# ---H--------------H---------------------------------------H--------------H--- #

# ------ CONTENTS ------ #
# 1. Prompt
# 2. Config
# 3. Layout
# 4. Aliases
# 5. Path
# 6. Functions
# -----------------------#

# -------------------------------- P R O M P T -------------------------------- #
gb () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/⑂ \1/'
}
ARROW=''
RESET='\e[0m'
BLACK_BG='\e[48;5;0m'
WHITE_FG='\e[38;5;255m'
RED_FG='\e[38;5;1m'
RED_BG='\e[48;5;1m'
YELLOW_FG='\e[38;5;9m'
YELLOW_BG='\e[48;5;9m'
export PS1="\n\[$RED_BG\]\[$WHITE_FG\] \w \[$RESET\]\[$RED_FG\]\[$YELLOW_BG\]\[$WHITE_FG\] \$(gb) \[$RESET\]\[$BLACK_BG\]\[$YELLOW_FG\]\[$RESET\] "
# ----------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------- #
# -------------------------------- C O N F I G -------------------------------- #
# ----------------------------------------------------------------------------- #
export LANG=en_US.UTF-8 # Set Locale
set -o vi         # Turn vi mode on
export CLICOLOR=1 # Colors for ls


# ----------------------------------------------------------------------------- #
# -------------------------------- L A Y O U T -------------------------------- #
# ----------------------------------------------------------------------------- #

# -> HOME <- #
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/Videos
mkdir -p ~/Graphics
mkdir -p ~/Code
mkdir -p ~/Code/src
mkdir -p ~/Code/pkg
mkdir -p ~/Code/bin

# -> VIM <-#
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/temp
mkdir -p ~/.vim/undo

# ----------------------------------------------------------------------------- #
# ------------------------------- A L I A S E S ------------------------------- #
# ----------------------------------------------------------------------------- #


# -> DOCKER <- #

alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias dmaws='docker-machine create --driver amazonec2 --amazonec2-region $AWS_DEFAULT_REGION --amazonec2-access-key $AWS_ACCESS_KEY_ID  --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY --amazonec2-vpc-id $AWS_VPC_ID'
alias dmgce='docker-machine create --driver google --google-project $GOOGLE_CLOUD_PROJECT'

# -> KUBERNETES <- #

alias k='kubectl'

# -> TMUX <- #

alias t='tmux -u2'
alias tmux='tmux -u2'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias twn='tmux new-window'
alias tws='tmux select-window'
alias tv='tmux split-window'
alias th='tmux split-window -h'
alias tl='tmux list-sessions'

# -> VIM <- #
alias v='vim'
alias vi='vim'

# -> GIT <- #
alias g="git"

# -> DOTFILES <- #
alias evi='vim ~/.vimrc'
alias ebash='vim ~/.bash_profile'
alias egit='vim ~/.gitconfig'

# -> DIRECTORIES <- #
alias doc='cd ~/Documents'
alias documents='cd ~/Documents'

alias dow='cd ~/Downloads'
alias downloads='cd ~/Downloads'

alias pic='cd ~/Pictures'
alias pictures='cd ~/Pictures'

alias vid='cd ~/Videos'
alias videos='cd ~/Videos'

alias mus='cd ~/Music'
alias music='cd ~/Music'

alias gra='cd ~/Graphics'
alias graphics='cd ~/Graphics'

alias c='cd ~/Code/src'
alias code='cd ~/Code/src'
alias CODE='cd ~/Code/src'

alias cgh='cd ~/Code/src/github.com'

# ----------------------------------------------------------------------------- #
# ---------------------------------- P A T H ---------------------------------- #
# ----------------------------------------------------------------------------- #

export PATH=$PATH:$HOME/Code/bin

# ----------------------------------------------------------------------------- #
# ----------------------------- F U N C T I O N S ----------------------------- #
# ----------------------------------------------------------------------------- #

# ----------------------------------------------- #
# -> dms: Switch docker to a different instance
dms () { eval "$(docker-machine env $1)" ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> dkill: Kill and remove a container
dkill () { eval "$(docker kill $1 && docker rm $1)" ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> boot: Open development environment on daemon
boot () { eval "$(dms $1 && docker run -it --env-file $2 --privileged -p 80:80 -p 443:443 -p 8080:8080 ericsage/os /bin/bash )" ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> httpHeaders: Grabs headers from web page # <- #
httpHeaders () { /usr/bin/curl -I -L $@ ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> httpDebug: Download a web page and show info on what took time <- #
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
# ----------------------------------------------- #
#
# ----------------------------------------------------------------------------- #
