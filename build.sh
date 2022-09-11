#!/bin/bash

BASE_PATH="$(pwd)"

mkdir cache
mkdir cache/modCache
mkdir public

cd cache || exit 1

function cache() {
  if [[ $1 == "clearModCache" ]]
    then {
      rm -rf "$BASE_PATH"/cache/modCache
      mkdir "$BASE_PATH"/cache/modCache
    }
    elif [[ $1 == "clearCache" ]]
      then {
        rm -rf "$BASE_PATH"/cache
      }
      else {
        echo -n "Caching \"$1\". "
        mkdir "$1"
        cp -rf "$BASE_PATH"/kernel/. "$1"/
        cp -rf -u "$BASE_PATH"/instances/"$1"/. "$BASE_PATH"/cache/modCache
        cp -rf "$BASE_PATH"/cache/modCache/. "$1"/.minecraft
        cd "$1" || exit 1
        "$BASE_PATH"/packwiz refresh &> /dev/null
        cd "$BASE_PATH"/cache || exit 1
        pnpm exec:ts updateInstance.ts "$1" &> /dev/null
        cp -rf "$1" "$BASE_PATH"/public
        pnpm exec:ts compressInstance.ts "$1" &> /dev/null
        echo "Done!"
      }
  fi
}

echo "Updating cache..."
cache base 
cache enhanced
cache extra

cache clearModCache
cache beta
cd "$BASE_PATH" || exit 1
echo "Cache updated"

echo -n "Cleaning up... "
cache clearCache
echo "Done!"

echo -n "Finishing up... "
cp -rf web/* public

echo "Done!"
echo "Finished everything!"