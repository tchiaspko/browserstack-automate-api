#!/bin/bash -e

function setup_bundle {
echo "Setup under vendor/bundle folder"
  gem install bundler -v 1.17.2
  bundle _1.17.2_ install
  bundle install --jobs=3 --retry=3 --path="${BUNDLE_PATH:-vendor/bundle}"
}

function run_rubocop {
  echo "Running Rubocop"
  rake rubocop
}

function install_geminabox_plugin {
  echo "Installing geminabox"
  gem install geminabox
}

function increment_version {
  echo "Installing bump"
  gem install bump
  echo "Increment the version number"
  bump patch --no-commit
}

function build_package {
  rake build
}

function upload_gem_pkg {
  LATEST_GEM_PKG=$(find ./pkg -type f -name "*.gem" -print0 | xargs -0 ls -tr | tail -n 1)
  echo "Uploading the latest gem package: ${LATEST_GEM_PKG} to http://gems.spokeo.com"
  gem inabox "${LATEST_GEM_PKG}" --host http://gems.spokeo.com | tee upload_output.log
  echo "Checking upload result..."
  RESULT=$(grep "received and indexed" upload_output.log)
  if [ "$RESULT" != "" ]; then
    echo "Uplaod Successful. You should see the new verson on https://gems.spokeo.com"
    echo "Current browserstack-automate-api packages on https://gemspokeo.com"
    gem search -ra ^browserstack-automate-api$ --source https://gems.spokeo.com
  else
    echo "ERROR: Uplaod failed."
    echo "Current browserstack-automate-api packages on https://gemspokeo.com"
    gem search -ra ^browserstack-automate-api$ --source https://gems.spokeo.com
    exit 1
  fi
}

function push_version_change_back_to_github {
  echo "Finding the changed files. Should be only the ./lib/browserstack/automate/api/version.rb"
  git status
  echo "Adding changed file to be commited"
  git add -u lib/browserstack/automate/api/version.rb
  git status
  echo "commit the change"
  git commit -m "Updated from $BUILD_URL"
  echo "Push to remote git repo"
  git push origin master
}

setup_bundle
run_rubocop
install_geminabox_plugin
increment_version
build_package
push_version_change_back_to_github
upload_gem_pkg
