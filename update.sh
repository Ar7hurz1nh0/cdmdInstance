#!/bin/bash

( pnpm exec:ts update.ts "$@" && {
  git add .
  git commit -m "Update at $(date +%Y-%m-%d-%H-%M-%S)"
  git push origin master
  echo "Done!"

  echo "Finished everything!"
} ) || { echo "Command failed, exiting..."; exit 1; }