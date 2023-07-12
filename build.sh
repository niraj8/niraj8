#!/usr/bin/env bash

npx @11ty/eleventy --input=. --output=docs --formats=md
mkdir -p build/images
cp -r images/ docs/images/
cp CNAME docs/CNAME
