#!/bin/bash


echo "Setup"
gem install bundler -v 1.17.2

bundle _1.17.2_ install

bundle install --jobs=3 --retry=3 --path="${BUNDLE_PATH:-vendor/bundle}"

echo "Running Rubocop"
rake rubocop
