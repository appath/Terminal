#!/usr/bin/env bash
# $Vim set fileformat=unix, wq!

kernel=$(uname -rmo)
system=$(source /etc/os-release && echo $PRETTY_NAME)
pkg=$(pacman -Q | wc -l)
wm=$(xprop -id ${WM//* } _NET_WM_NAME | sed -re 's/.*= "(.*)"/\1/')
memory=$()

cat << EOF

Os ................ $system
Kernel ............ $kernel
Package ........... $pkg

EOF
