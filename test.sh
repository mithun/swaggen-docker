. ./env.sh

SWAGGEN_TEST_VERSION=$(docker run --rm "${DOCKER_USER}/${DOCKER_PROJECT}:${DOCKER_VERSION}" swaggen --version)

echo "SWAGGEN_TEST_VERSION: ${SWAGGEN_TEST_VERSION}"
echo "LAST_SWAGGEN_VERSION: ${LAST_SWAGGEN_VERSION}"
if [[ "${LAST_SWAGGEN_VERSION}" == "${SWAGGEN_TEST_VERSION}" ]]; then
	echo "👍"
else
	echo "👎"
fi