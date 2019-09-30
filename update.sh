# Set version
declare SWAGGEN_VERSION="$(cat VERSION)"

# Build
docker build                                   \
--build-arg SWAGGEN_VERSION=${SWAGGEN_VERSION} \
--force-rm                                     \
--pull                                         \
--tag mackoj/unofficial-swaggen-docker:${SWAGGEN_VERSION}      \
.

# Test
docker run --rm mackoj/unofficial-swaggen-docker:${SWAGGEN_VERSION} swaggen --version

# Push
docker login
docker tag mackoj/unofficial-swaggen-docker:${SWAGGEN_VERSION} mackoj/unofficial-swaggen-docker:latest
docker push mackoj/unofficial-swaggen-docker:${SWAGGEN_VERSION}
docker push mackoj/unofficial-swaggen-docker:latest

# Tag docker repo
git tag "v${SWAGGEN_VERSION}"
