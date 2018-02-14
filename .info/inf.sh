#!/usr/bin/env bash
#  Info a CLI bash script to show system
#
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
#
#  To correct while so VIM :set fileformat=unix save file :wq!

source $HOME/.info/color
kernel=$(uname -rmo)
system=$(source /etc/os-release && echo $PRETTY_NAME)
pkgs=$(pacman -Q | wc -l)
shell=$(echo "$SHELL" "$BASH_VERSION)
wm=$(xprop -id ${WM//* } _NET_WM_NAME | sed -re 's/.*= "(.*)"/\1/')
memory=$()

cat << EOF

${f1}Os ${f0}................ $f2$system
${f1}Kernel ${f0}............ $f2$kernel
${f1}Shell ${f0}............. $f2$shell
${f1}Package ${f0}........... $f2$pkgs

EOF