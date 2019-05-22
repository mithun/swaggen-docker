## Publishing

```bash
# Set version
declare SWAGGEN_VERSION="$(cat VERSION)"

# Build
docker build                                   \
--build-arg SWAGGEN_VERSION=${SWAGGEN_VERSION} \
--force-rm                                     \
--pull                                         \
--tag mayachit/swaggen:${SWAGGEN_VERSION}      \
.

# Test
docker run --rm mayachit/swaggen:${SWAGGEN_VERSION} swaggen --version

# Push
docker login
docker tag mayachit/swaggen:${SWAGGEN_VERSION} mayachit/swaggen:latest
docker push mayachit/swaggen:${SWAGGEN_VERSION}
docker push mayachit/swaggen:latest

# Tag docker repo
git tag "v${SWAGGEN_VERSION}"
```
