function ssh -d "Replacement ssh function that uses fish on the remote, if available."
  # Command copied from: https://unix.stackexchange.com/a/476108
  /usr/bin/env ssh "$argv" -t "sh -c 'if which fish >/dev/null ; then exec fish -li; else exec \$SHELL -li; fi'"
end