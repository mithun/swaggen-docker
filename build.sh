. ./env.sh

./getLastSwiftTag.swift "apple/swift" "-RELEASE" NEW_SWIFT_VERSION

LAST_SWIFT_VERSION="$(cat NEW_SWIFT_VERSION)"
OLD_LAST_SWAGGEN_VERSION="$(cat LAST_SWAGGEN_VERSION)"
OLD_LAST_SWIFT_VERSION="$(cat LAST_SWIFT_VERSION)"

if [[ "${LAST_SWAGGEN_VERSION}" != LAST_SWAGGEN_VERSION ]] && [[ "${LAST_SWIFT_VERSION}" != OLD_LAST_SWIFT_VERSION ]]; then
    # Build
    docker build                                                    \
    --build-arg DOCKER_VERSION="${DOCKER_VERSION}"                  \
    --build-arg SWAGGEN_VERSION="${SWAGGEN_VERSION}"                \
    --build-arg SWAGGEN_REPO="${SWAGGEN_REPO}"                      \
    --build-arg MAINTAINER="${MAINTAINER}"                          \
    --force-rm                                                      \
    --pull                                                          \
    --tag "${DOCKER_USER}/${DOCKER_PROJECT}:${DOCKER_VERSION}"      \
    .

    echo "${LAST_SWAGGEN_VERSION}" > LAST_SWAGGEN_VERSION
    echo "${LAST_SWIFT_VERSION}" > LAST_SWIFT_VERSION
else
  echo "No need to update"
fi

