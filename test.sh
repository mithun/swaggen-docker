. ./env.sh

SWAGGEN_TEST_VERSION=$(docker run --rm "${DOCKER_USER}/${DOCKER_PROJECT}:${DOCKER_VERSION}" swaggen --version)
if [[ "Version: ${LAST_SWAGGEN_VERSION}" == "${SWAGGEN_TEST_VERSION}" ]]; then
	echo "👍"
else
	echo "👎"
fi