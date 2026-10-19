#!/bin/bash

# Author: Illia Svyrydenko (nerkeed)
# Date: October 8, 2026
# Desc: makes users starting from "user01" up to "user10" inclusive
#     : users also include a "README" file in their home directories

function createUsers() {
    # iterate through a loop 10 times 
    for ((i=1; i<=10; i++)); do
        username=$(printf "user%02d" "$i")
        echo "$username"

        # if username exists, skip
        if id "$username" &>/dev/null; then # if id of $username says user exists; dismiss of any output
            echo "$username already exists, skipping" 
            continue # skip user creation for specific index
        fi

        # create new user without setting password; create README.txt and dismiss of any output
        sudo useradd -m "$username"
        echo "Welcome to $username home directory." | sudo tee "/home/$username/README.txt" > /dev/null

        sudo chown "$username:$username" "/home/$username/README.txt" # change the ownership to $username

        # change permissions to $username and README.txt of said $username
        sudo chmod 755 "/home/$username"
        sudo chmod 644 "/home/$username/README.txt"

        echo "Created $username"
    done
}

createUsers