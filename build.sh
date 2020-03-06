. ./env.sh

echo "Last Swaggen Release: ${LAST_SWAGGEN_VERSION}"

if [[ "${LAST_SWAGGEN_VERSION}" != "${OLD_LAST_SWAGGEN_VERSION}" ]] || [[ "${LAST_SWIFT_VERSION}" != "${OLD_LAST_SWIFT_VERSION}" ]]; then
    echo "${LAST_SWAGGEN_VERSION}" > VERSION
    echo "${LAST_SWIFT_VERSION}" > LAST_SWIFT_VERSION

    # Build
    docker build                                                    \
    --build-arg DOCKER_VERSION="${DOCKER_VERSION}"                  \
    --build-arg SWAGGEN_VERSION="${LAST_SWAGGEN_VERSION}"           \
    --build-arg SWAGGEN_REPO="${SWAGGEN_REPO}"                      \
    --build-arg MAINTAINER="${MAINTAINER}"                          \
    --force-rm                                                      \
    --pull                                                          \
    --tag "${DOCKER_USER}/${DOCKER_PROJECT}:${DOCKER_VERSION}"      \
    .

else
  echo "-- Last Build info"
  echo "Swaggen: ${OLD_LAST_SWAGGEN_VERSION}"
  echo "Swift: ${OLD_LAST_SWIFT_VERSION}"
  echo "No need to update 👍"
fi

rm NEW_SWIFT_VERSION
