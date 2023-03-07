#!/usr/bin/env bash

rm -rf docs
npx @11ty/eleventy --input=. --output=docs --formats=md
