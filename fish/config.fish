if status is-interactive
    # remove greeting message
    set fish_greeting

    # Set up programs
    if type -q starship
        set -Ux STARSHIP_LOG error
        eval "$(starship init fish)"
    end

    if type -q zoxide
        eval "$(zoxide init fish)"
        alias cd="z"
    end

    # Set up some specific aliases
    if type -q zypper
        alias zyp="zypper"
    end

    if type -q eza
        alias ls="eza"
    end
end

# aliases
alias gpu-power="sudo cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status"
alias py="python3"
alias ipy="ipython"

# larger command shorthands
alias update='sudo snapper create -d "Before zyp dup"; sudo zyp dup'
alias mylocalip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Wellesley VPN
alias wellesley-vpn="openvpn3 session-start --config Wellesley"
alias wellesley-vpn-disconnect="openvpn3 session-manage --disconnect --config Wellesley"

# pip 3.13
alias pip="python3.13 -m pip"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/crystal/.opam/opam-init/init.fish' && source '/home/crystal/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
