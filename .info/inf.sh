#!/usr/bin/env bash
#  Info a CLI bash script to show system ARCH
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
#
#  SHELL Bash
#  v.0.1b

source $HOME/.info/color
user=$(whoami || printf "%s" "${HOME/*\/}")
hostname=$(hostname)
kernel=$(uname -rmo)
system=$(source /etc/os-release && echo $PRETTY_NAME)
pkgs=$(pacman -Q | wc -l)
shell=$(grep `id -u` /etc/passwd | awk -F ':' '{ print $7 }')
memory=$(free -m | awk 'FNR==2{ printf "%sMB / %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
disk=$(df -H | grep '/dev/sda3' | tail -1 | awk '{ printf $3 " / " $2 " (" $5 ") " }')
date=$(date +"%a %d %b %Y %H:%M %p")

cat << EOF

${p0}Os ${f0}**************** $f2$system
${p0}Kernel ${f0}************ $f2$kernel
${p0}Shell ${f0}************* $f2$shell
${p0}Package ${f0}*********** $f2$pkgs
${p0}Memory ${f0}************ $f2$memory
${p0}Disk (${p1}/${p0}) ${f0}********** $f2$disk
${p0}Date ${f0}************** $f2$date

EOF
