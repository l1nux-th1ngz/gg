#!/bin/bash

# Function to clone repositories
clone_repos() {
    # Get the user input from the form
    input=$(yad --title="Git Cloner" --form --field="Link To Clone:CB" --field="Alternate Clone Directory":CBE --button="gtk-Cancel" --button="gtk-Stop-Cloning:0" --button="gtk-Clone:1")
    
    # Parse the input into an array
    IFS='|' read -ra input_array <<< "$input"
    
    # Get the repository URL and the directory from the array
    repo_url="${input_array[0]}"
    dir="${input_array[1]}"
    
    # Clone the repository
    if [ -z "$dir" ]; then
        git clone "$repo_url"
    else
        git clone "$repo_url" "$dir"
    fi
}

# Main script
clone_repos
