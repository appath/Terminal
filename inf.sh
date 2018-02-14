#!/usr/bin/env bash
# " A handy     
#   tool INFO
#    command line "
#    		2018

kernel=$(uname -rmo)
system=$(source /etc/os-release && echo $PRETTY_NAME)
pkg=$(pacman -Q | wc -l)
wm=$(xprop -id ${WM//* } _NET_WM_NAME | sed -re 's/.*= "(.*)"/\1/')
memory=$()


cat << EOF


Os ................ $system
Package ........... $pkg


EOF