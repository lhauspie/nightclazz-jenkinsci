#!/bin/sh
#
# Deploy the application to the artefact repository

set -eu -o pipefail
set +x

echo "== Deploying to the artefact store..."
sleep 5

echo "== Triggering Delivery to the following environment:"
echo "---- DEPLOY_TARGET=${DEPLOY_TARGET:-staging}"
sleep 5

echo "== Deployed and delivered!"
