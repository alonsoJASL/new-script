#!/usr/bin/env bash
set -euo pipefail

if [ $# -eq 0 ] ; then
    >&2 echo "No arguments supplied"
    exit 1
fi

NAME=$1
NARGS=$2

touch "$NAME.sh"

echo "#!/usr/bin/env bash" > "$NAME.sh"
echo "set -euo pipefail" >> "$NAME.sh"

echo "" >> "$NAME.sh"

echo "if [ "'$#'" -eq 0 ] ; then" >> "$NAME.sh"
echo "    >&2 echo 'No arguments supplied'" >> "$NAME.sh"
echo "    exit 1" >> "$NAME.sh"
echo "fi" >> "$NAME.sh"

echo "" >> "$NAME.sh"

for n in $(seq 1 $NARGS); do
    echo "VAR$n="'$'"$n" >> "$NAME.sh"
done
