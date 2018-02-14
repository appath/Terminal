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
shell=$(echo "$SHELL" $p0"$BASH_VERSION)
wm=$(xprop -id ${WM//* } _NET_WM_NAME | sed -re 's/.*= "(.*)"/\1/')

get_memory() {
    case "$memory" in
        "Linux")
            # MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
            # Source: https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716
            while IFS=":" read -r a b; do
                case "$a" in
                    "MemTotal") mem_used="$((mem_used+=${b/kB}))"; mem_total="${b/kB}" ;;
                    "Shmem") mem_used="$((mem_used+=${b/kB}))"  ;;
                    "MemFree" | "Buffers" | "Cached" | "SReclaimable")
                        mem_used="$((mem_used-=${b/kB}))"
                    ;;
                esac
            done < /proc/meminfo

            mem_used="$((mem_used / 1024))"
            mem_total="$((mem_total / 1024))"
        ;;
        
    esac
    memory="${mem_used}${mem_label:-MiB} / ${mem_total}${mem_label:-MiB}"

    case "$memory_display" in
        "bar") memory="$(bar "${mem_used}" "${mem_total}")" ;;
        "infobar") memory="${memory} $(bar "${mem_used}" "${mem_total}")" ;;
        "barinfo") memory="$(bar "${mem_used}" "${mem_total}")${info_color} ${memory}" ;;
    esac
}

cat << EOF

${f1}Os ${f0}................ $f2$system
${f1}Kernel ${f0}............ $f2$kernel
${f1}Shell ${f0}............. $f2$shell
${f1}Package ${f0}........... $f2$pkgs

EOF
