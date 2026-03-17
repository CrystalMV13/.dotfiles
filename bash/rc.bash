# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# ble.sh header
# [[ $- == *i* ]] && source /home/crystal/ble.sh/ble.sh --noattach

test -s ~/.alias && . ~/.alias || true

alias sudo='sudo ' # needed to use sudo zyp
alias zyp='zypper'
alias gpu-power='sudo cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status'
alias py='python3'
alias ipy='ipython'
alias pipin="pip install --break-system-packages"

eval "$(starship init bash)"

# ble.sh footer
# [[ ${BLE_VERSION-} ]] && ble-attach
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/crystal/.applications/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/crystal/.applications/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/crystal/.applications/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/crystal/.applications/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
