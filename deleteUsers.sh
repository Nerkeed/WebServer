#!/bin/bash

# Author: Illia Svyrydenko (nerkeed)
# Date: October 19, 2026
# Desc: deletes users starting from "user01" up to "user10" inclusive

function deleteUsers() {
    for ((i=1; i<=10; i++)); do
        username=$(printf "user%02d" "$i")
        sudo userdel -r "$username" # -r argument removes user's home directory too
        echo "deleted $username"
    done
}

deleteUsers