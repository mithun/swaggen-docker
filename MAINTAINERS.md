## Publishing

```bash
# Set version
declare SWAGGEN_VERSION="$(cat VERSION)"

# Build
docker build                                   \
--build-arg SWAGGEN_VERSION=${SWAGGEN_VERSION} \
--force-rm                                     \
--pull                                         \
--tag mackoj/swaggen-docker:${SWAGGEN_VERSION}      \
.

# Test
docker run --rm mackoj/swaggen-docker:${SWAGGEN_VERSION} swaggen --version

# Push
docker login
docker tag mackoj/swaggen-docker:${SWAGGEN_VERSION} mayachit/swaggen:latest
docker push mackoj/swaggen-docker:${SWAGGEN_VERSION}
docker push mackoj/swaggen-docker:latest

# Tag docker repo
git tag "v${SWAGGEN_VERSION}"
```
