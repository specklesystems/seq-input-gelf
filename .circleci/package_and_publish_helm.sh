#!/usr/bin/env bash

set -eo pipefail

TEMP_PACKAGE_DIR="${TEMP_PACKAGE_DIR:-"/tmp/.cr-release-packages"}"
HELM_PACKAGE_BRANCH="${HELM_PACKAGE_BRANCH:-"gh-pages"}"
HELM_STABLE_BRANCH="${HELM_STABLE_BRANCH:-"main"}"
HELM_CHART_DIR_PATH="${HELM_CHART_DIR_PATH:-"charts/seq-input-gelf"}"

if [[ -z "${VERSION}" ]]; then
  echo "VERSION environment variable should be set"
  exit 1
fi

if [[ -z "${APP_VERSION}" ]]; then
  echo "APP_VERSION environment variable should be set"
  exit 1
fi

if [[ -z "${GIT_EMAIL}" ]]; then
  echo "GIT_EMAIL environment variable should be set"
  exit 1
fi
if [[ -z "${GIT_USERNAME}" ]]; then
  echo "GIT_USERNAME environment variable should be set"
  exit 1
fi

echo "๐งน cleaning temporary directory"
rm -rf "${TEMP_PACKAGE_DIR}" || true
mkdir "${TEMP_PACKAGE_DIR}"

helm version -c

echo "๐๏ธ building dependencies"
helm dependency build "${HELM_CHART_DIR_PATH}"
echo "๐ packaging ${HELM_CHART_DIR_PATH} with version: ${VERSION}"
helm package "${HELM_CHART_DIR_PATH}" --dependency-update --version "${VERSION}" --app-version "${APP_VERSION}" --destination "${TEMP_PACKAGE_DIR}"

echo "โฌ checking out git branch '${HELM_PACKAGE_BRANCH}'"
git config user.email "${GIT_EMAIL}"
git config user.name "${GIT_USERNAME}"
git fetch
git switch "${HELM_PACKAGE_BRANCH}"
if [[ -n "${CIRCLE_TAG}" || "${CIRCLE_BRANCH}" == "${HELM_STABLE_BRANCH}" ]]; then
  echo "๐ป copying packages to stable directory"
  cp -a "${TEMP_PACKAGE_DIR}/." stable/
  pushd stable
  helm repo index .
  popd
else
  cp -a "${TEMP_PACKAGE_DIR}/." incubator/
  echo "๐ป copying packages to incubator directory"
  pushd incubator
  helm repo index .
  popd
fi

echo "โซ adding, commiting, and pushing to git repository"
git add .
git commit -m "updating helm chart to version ${VERSION}"
git push --set-upstream origin "${HELM_PACKAGE_BRANCH}"
