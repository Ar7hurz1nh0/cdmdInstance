#!/bin/bash
cd instance
../packwiz refresh
echo "Updating cache..."
cp -rf -v -u * /var/multimc
cp -v -u .packignore /var/multimc
cp -rf -v -u .minecraft /var/multimc
zip ../comunismo . -r -9 -FS
echo "Cache updated"
echo "Cleaning old files"
rm -rf -v $(diff -rq . /var/multimc | awk '/Only in \/var\/multimc/{print substr($3, 1, length($3)-1) "/" $4}')
echo "Everything cleaned, proceeding to update"
cd ..
#zip -d comunismo.zip "installer.jar"
echo -n "Updating instance... "
cp comunismo.zip /var/multimc
echo "Done!"

echo "Finished everything!"