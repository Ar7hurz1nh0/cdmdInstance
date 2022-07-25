#!/bin/bash
cd instance
../packwiz refresh
echo "Updating cache..."
mkdir ../public
cp -rf -v -u * ../public
cp -v -u .packignore ../public
cp -rf -v -u .minecraft ../public
echo "Cache updated"
echo "Updating instance... "
cd ..
tsc index.ts
node .
echo "Done!"
echo "Finished everything!"