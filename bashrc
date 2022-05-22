# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

# kali tty podman container with GUI ability (remember to enable xhost + on host!): xhost +si:localuser:$USER
alias create_kali="podman container create --name=kali -it -e DISPLAY=$DISPLAY --network host -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Documents/kali_shared:/home/kali_shared kalilinux/kali-last-release"

alias kali="xhost +si:localuser:$USER; podman container start kali; podman container attach kali"
