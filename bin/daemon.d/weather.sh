#!/bin/sh
#echo "* weather.sh"
curl 'wttr.in/hk?0q' > /tmp/.weather0 2>/dev/null
sed -ri 's/\x1b\[38;5;0?[0-5][0-9](;[0-9]?[0-9]?)?m/\${color 00f}/g;s/\x1b\[38;5;0?[6-9][0-9](;[0-9]?[0-9]?)?m/\${color 0011af}/g;s/\x1b\[38;5;1[0-3][0-9](;[1-9]?[0-9]?)?m/\${color 11330f}/g;s/\x1b\[38;5;1[4-6][0-9](;[0-9]?[0-9]?)?m/\${color 1188ef}/g;s/\x1b\[38;5;1[7-9][0-9](;1)?m/\${color f00}/g;s/\x1b\[38;5;2[0-2][0-9](;[0-9]?[0-9]?)?m/\${color fa3}/g;s/\x1b\[38;5;2[3-5][0-9](;[0-9]?[0-9]?)?m/\${color ff0}/g;s/\x1b\[38;5;2[6-8][0-9](;[0-9]?[0-9]?)?m/\${color fff}/g;s/\x1b\[[0-1]m/\${color}/g;s/\x20\xe2\x80\x95/--/g' /tmp/.weather0
cat /tmp/.weather0 |  awk '{printf"${voffset 0}${offset '"$off"'}";print}'
