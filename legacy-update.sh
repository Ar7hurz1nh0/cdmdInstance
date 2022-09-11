#!/bin/bash
cd instance || exit
../packwiz refresh
echo "Updating cache..."
sudo cp -rf -v -u * /var/multimc
sudo cp -v -u .packignore /var/multimc
sudo cp -rf -v -u .minecraft /var/multimc
zip ../comunismo . -r -9 -FS
echo "Cache updated"
echo "Cleaning old files"
sudo rm -rf -v $(diff -rq . /var/multimc | awk '/Only in \/var\/multimc/{print substr($3, 1, length($3)-1) "/" $4}')
echo "Everything cleaned, proceeding to update"
cd ..
#zip -d comunismo.zip "installer.jar"
echo -n "Updating instance... "
sudo cp comunismo.zip /var/multimc
echo "Done!"

echo "Finished everything!"