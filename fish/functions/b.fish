function b -d "build using ./build.sh, if possible"
    if ! test -f "./build.sh"
        echo "no ./build.sh file found!"
        return 1
    end

    ./build.sh
end

