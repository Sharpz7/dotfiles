#!/bin/bash

# Default version
VERSION="1.21.3"

# Function to display help
show_help() {
    echo "Usage: goinstall.sh [-v version]"
    echo "Options:"
    echo "  -v    Set the Go version. Default is 1.19.7."
    echo "  -h    Display this help message."
}

# Parse command line arguments
while getopts ":v:h" opt; do
    case "$opt" in
        v)
            VERSION="$OPTARG"
            ;;
        h)
            show_help
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            show_help
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            show_help
            exit 1
            ;;
    esac
done

# Main script
echo "Installing Go version $VERSION..."

go install golang.org/dl/go$VERSION@latest && \
go$VERSION download && \
rm -rf /root/sdk/go$VERSION/go$VERSION.linux-amd64.tar.gz && \
go$VERSION version

if [ $? -eq 0 ]; then
    echo "Go version $VERSION successfully installed!"
else
    echo "Failed to install Go version $VERSION."
fi
