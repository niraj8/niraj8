#!/usr/bin/env bash

rm -rf docs
npx -y @11ty/eleventy --input=. --output=docs
