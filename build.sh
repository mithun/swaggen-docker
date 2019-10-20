# Set version
declare SWAGGEN_VERSION="4.2.0"
declare MAINTAINER="original maintainer - Mithun Ayachit <m0t0rbr3th@gmail.com>"
declare SWAGGEN_REPO="https://github.com/yonaskolb/SwagGen"
declare DOCKER_USER="hawkci"
declare DOCKER_PROJECT="swaggen"
# declare SWIFT_VERSION="swift:5.1.1"

# Build
docker build                               						\
--build-arg SWAGGEN_VERSION="${SWAGGEN_VERSION}"				\
--build-arg SWAGGEN_REPO="${SWAGGEN_REPO}"						\
--build-arg MAINTAINER="${MAINTAINER}"							\
--force-rm														\
--pull															\
--tag "${DOCKER_USER}/${DOCKER_PROJECT}:${SWAGGEN_VERSION}"		\
.
