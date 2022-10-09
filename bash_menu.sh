#!/bin/bash

function podList() {
    echo '-----------------------------------------IMAGES------------------------------------------------------------'
    podman images
    echo '------------------------------------------PODS-------------------------------------------------------------'
    podman ps -a
    echo '-----------------------------------------------------------------------------------------------------------'
}
function newPod() {
    echo 'What is the address of your Pod?'
    read address
    echo 'what would you like to name your pod?'
    read name
    DIR=~/Desktop/$name'_shared'
    if [ -d "$DIR" ]; then
        echo "$DIR exists."
    else
        mkdir $DIR
    fi
    echo 'creating pod...'
    podman pull $address;podman container create --name=$name -it -e DISPLAY=$DISPLAY --network host -v /tmp/.X11-unix:/tmp/.X11-unix -v $DIR:/home/$name'_shared' $address
}
function attachPod() {
    echo 'attach script'
    podman ps -a | grep "docker.io"| cut -d " " -f 35 > ./pods.txt

}
function removePod() {
    echo 'remove script'
}
podList

echo 'What would you like to do?'
select mainMenu in New Attach Remove Quit
do
    case $mainMenu in
        "New")
            newPod;;
        "Attach")
           attachPod;;
        "Remove")
           removePod;;
        "Quit")
           echo "Exiting..."
           break;;
        *)
           echo "Error";;
    esac
done

: '
# 2.check for shared folder if it doesnt exitst make it
# 3. podman pull <address>

# kali tty podman container with GUI ability
alias create_kali="podman pull kali-shared;podman container create --name=kali -it -e DISPLAY=$DISPLAY --network host -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Desktop/kali_shared:/home/kali_shared kalilinux/kali-rolling"

alias kali="xhost +si:localuser:$USER; podman container start kali; podman container attach kali"
'
