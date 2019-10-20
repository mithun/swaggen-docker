. ./env.sh

# Build
docker build                               						\
--build-arg SWAGGEN_VERSION="${SWAGGEN_VERSION}"				\
--build-arg SWAGGEN_REPO="${SWAGGEN_REPO}"						\
--build-arg MAINTAINER="${MAINTAINER}"							\
--force-rm														\
--pull															\
--tag "${DOCKER_USER}/${DOCKER_PROJECT}:${SWAGGEN_VERSION}"		\
.
