# rudimentary golang setup

export PATH=$HOME/golang/bin:$PATH
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

echo "GOBIN : $GOBIN"
echo "PATH  : $PATH"
echo "GOROOT: $GOROOT"
echo "GOARCH: $GOARCH"
