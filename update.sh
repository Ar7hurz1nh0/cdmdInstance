#!/bin/bash
cd instance
../packwiz refresh
echo "Everything cleaned, proceeding to update"
cd ..
echo -n "Updating instance... "
git add .
git commit -m "Update at $(date +%Y-%m-%d-%H-%M-%S)"
git push origin master
echo "Done!"

echo "Finished everything!"