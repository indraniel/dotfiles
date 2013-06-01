# rudimentary golang setup

function warn() {
    printf '\033[0;31m%s\033[0m\n' "$1" >&2
}

function die() {
    warn "$1"
    exit 1
}

function note() {
    printf '\033[0;34m%s\033[0m\n' "$1"
}

export PATH=$HOME/golang/bin:$PATH
export GOPATH=$HOME/gopkgs         # place where we develop and store external pkgs
export GOROOT=$HOME/golang
export GOBIN=$GOROOT/bin
export GOOS=$(uname | awk '{print tolower($0)}')

arch=$(uname -m)
case $arch in
i686)
    export GOARCH=386
    ;;
x86_64)
    export GOARCH=amd64
    ;;
esac

if [ ! -d "$GOPATH" ]; then
    note "---> GOPATH directory '$GOPATH' does not exist - Creating directory"
    mkdir -p $GOPATH
fi

note "GOROOT: "
echo -e "\t$GOROOT"
note "GOBIN: "
echo -e "\t$GOBIN"
note "GOPATH: "
echo -e "\t$GOPATH"
note "GOOS"
echo -e "\t$GOOS"
note "GOARCH: "
echo -e "\t$GOARCH"
note "PATH: "
echo -e "\t$PATH"
