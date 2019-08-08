#!/bin/bash

function setup_bundle {
echo "Setup under vendor/bundle folder"
  gem install bundler -v 1.17.2
  bundle _1.17.2_ install
  bundle install --jobs=3 --retry=3 --path="${BUNDLE_PATH:-vendor/bundle}"
}

function install_geminabox_plugin {
  echo "Installing geminabox"
  gem install geminabox
}

function increment_version {
  echo "Increment the version number"
  bump patch 
}

function upload_gem_pkg {
  LATEST_GEM_PKG=$(find ./pkg -type f -print0 | xargs ls -tr | tail -n 1)
  echo "Uploading the latest gem package: ${LATEST_GEM_PKG} to http://gems.spokeo.com"
  gem inabox "${LATEST_GEM_PKG}" --host http://gems.spokeo.com | tee upload_output.txt
  echo "Checking upload result..."
  RESULT=$(grep "received and indexed" upload_output.txt)
  if [ "$RESULT" != "" ]; then
    echo "Uplaod Successful. You should see the new verson on https://gems.spokeo.com"
  else
    echo "ERROR: Uplaod failed."
    exit 1
  fi
}


setup_bundle
install_geminabox_plugin
increment_version
upload_gem_pkg
