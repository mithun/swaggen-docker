. ./env.sh

git tag "${DOCKER_VERSION}" -m "${LAST_SWAGGEN_VERSION}/${LAST_SWIFT_VERSION}"
git push origin "${DOCKER_VERSION}"
