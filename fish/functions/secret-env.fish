function secret-env -d "type and store a secret environment variable"
    read -s $argv[1]
    set -Ux $argv[1] $(echo $$argv[1])
end