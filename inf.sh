#!/usr/bin/env bash
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>

kernel=$(uname -rmo)
system=$(source /etc/os-release && echo $PRETTY_NAME)
pkg=$(pacman -Q | wc -l)
shell=$(echo $SHELL)
wm=$(xprop -id ${WM//* } _NET_WM_NAME | sed -re 's/.*= "(.*)"/\1/')
memory=$()

cat << EOF

Os ................ $system
Kernel ............ $kernel
Shell ............. $shell
Package ........... $pkg

EOF
