#!/bin/bash

# internsctl - Custom Linux command for managing interns

VERSION="v0.1.0"

function show_version {
    echo "internsctl $VERSION"
}

function get_file_info {
    if [ -z "$2" ]; then
        echo "Error: Please provide a filename."
        exit 1
    fi
    
    file_name="$2"
    
    # Check if the file exists
    if [ ! -e "$file_name" ]; then
        echo "Error: File '$file_name' not found."
        exit 1
    fi
    
    # Get file information
    file_access=$(stat -c %A "$file_name")
    file_size=$(stat -c %s "$file_name")
    file_owner=$(stat -c %U "$file_name")
    
    # Display the information
    echo "File:"
    echo "$file_name"
    echo "Access:"
    echo "Size(B):"
    echo "$file_size"
    echo "Owner:$file_access"
    echo "$file_owner"
}

case "$1" in
    --version)
        show_version
        ;;
    file)
        case "$2" in
            getinfo)
                get_file_info "$@"
                ;;
            *)
                echo "Error: Unknown command or option. Use 'internsctl --help' for usage information."
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Error: Unknown command or option. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac