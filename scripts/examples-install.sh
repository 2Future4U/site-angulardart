#!/usr/bin/env bash

set -e -o pipefail

[[ -z "$DART_SITE_ENV_DEFS" ]] && . ./scripts/env-set.sh

NGDOCEX=examples/ng/doc

travis_fold start install.e2e
set -x
(cd $NGDOCEX && npm install --no-optional)
npm run webdriver:update --prefix $NGDOCEX
gulp add-example-boilerplate
set +x
travis_fold end install.e2e
