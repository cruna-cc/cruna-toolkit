#!/usr/bin/env bash

cp package.json contracts/.
cp *.md contracts/.
cd contracts
npm publish
rm package.json
rm *.md
cd ..
