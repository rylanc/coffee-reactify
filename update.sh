#!/bin/bash
set -e
VERSION=`npm view coffee-react version`
npm install --save "coffee-react@${VERSION}"
npm test
git add ./package.json
git commit -m "updated coffee-react to v${VERSION}"
npm version $VERSION
git push origin master
npm publish .