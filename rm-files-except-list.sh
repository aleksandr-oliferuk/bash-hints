# This script removes all files in WORK_DIR directory, except listed in the EXCEPTIONS_LIST

#!/bin/bash
WORK_DIR=/working_directory
EXCEPTIONS_LIST=/dont_delete.txt

cd $WORK_DIR

# Exit if the directory isn't found
if (($?>0)); then
    echo "Can't find work dir... exiting"
    exit 1
fi

# Remove all files in the directory, except listed in the EXCEPTIONS_LIST
for i in *; do
    if ! grep -qxFe "$i" $EXCEPTIONS_LIST; then
        echo "Deleting: $i"
        rm -rf "$i"
    fi
done

exit 0
