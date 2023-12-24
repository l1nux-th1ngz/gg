#!/bin/bash

# Function to clone repositories
clone_repos() {
    # Get the user input from the form
    input=$(yad --title="Git Cloner" --form \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --field="Link To Clone:CB" \
        --field="Alternate Clone Directory:DIR" \
        --button="gtk-Cancel" \
        --button="gtk-Stop-Cloning:0" \
        --button="gtk-Clone:1")
    
    # Parse the input into an array
    IFS='|' read -ra input_array <<< "$input"
    
    # Iterate over each pair of repository URL and directory
    for ((i=0; i<${#input_array[@]}; i+=2)); do
        repo_url="${input_array[i]}"
        dir="${input_array[i+1]}"

        # Clone the repository
        if [ -n "$repo_url" ]; then
            if [ -z "$dir" ]; then
                git clone "$repo_url"
            else
                git clone "$repo_url" "$dir"
            fi
        fi
    done
}

# Main script
clone_repos
