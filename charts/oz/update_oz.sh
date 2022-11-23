#!/bin/bash
set -e

ORG=diranged
REPO=oz
REPOS_API_ENDPOINT=https://api.github.com/repos

getRelease () {
  local REL=${1}

  if [ -z "${REL}" ]; then
    echo "Usage: $0 <release version of oz controller>"
    exit 1
  fi

  if [ "${REL}" == "latest" ]; then
    local REL_PATH=${REPOS_API_ENDPOINT}/${ORG}/${REPO}/releases/latest
  else
    local REL_PATH="${REPOS_API_ENDPOINT}/${ORG}/${REPO}/releases/tags/${REL}"
  fi

  curl --fail -s "${REL_PATH}" || exit 1
}

if RELEASE_JSON=$(getRelease "$1"); then
  echo "Got release"
else
  echo "Invalid Release"
  exit 1
fi

# Get the tarball path from the JSON
TARBALL_URL=$(echo ${RELEASE_JSON} | jq -r .tarball_url)
TAG_NAME=$(echo ${RELEASE_JSON} | jq -r .tag_name)

# Download the Oz tarball into a temp path
OZ_TMP=$(mktemp)

# Info for the user
echo "Downloading ${TARBALL_URL} into ${OZ_TMP}..."
curl --fail -L "${TARBALL_URL}" -o "${OZ_TMP}"

# Wipe out the CRDs and get all new ones
git rm -rf crds || true
mkdir -p crds
tar -C crds --strip-components 4 -zxvf "${OZ_TMP}" "*/config/crd/bases"

# Update the Chart
sed -i .bak "s/^appVersion: .*$/appVersion: ${TAG_NAME}/g" Chart.yaml && rm -f Chart.yaml.bak

# Add back in the changes
git add .

# Update the ocs
make -C ../.. helm-docs
