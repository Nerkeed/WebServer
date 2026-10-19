#!/bin/bash

# Author: Illia Svyrydenko (Nerkeed)
# Date: October 19, 2026
# Desc: deletes users starting from "user01" up to "user10" inclusive

function deleteUsers() {
    for ((i=1; i<=10; i++)); do
        username=$(printf "user%02d" "$i")

        # if username exists, delete users
        if id "$username" &>/dev/null; then # if id of $username says user exists; dismiss of any output
            sudo userdel -r "$username" # -r argument removes user's home directory too
            echo "deleted $username"
        else # if user does not exists, skip
            echo "$username already exists, skipping"
        fi
    done
}

deleteUsers