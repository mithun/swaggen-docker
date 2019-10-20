# swaggen-docker

**Unofficial Docker image** for [SwagGen](https://github.com/yonaskolb/SwagGen)

## Available Tags

* `4.2.0-slim`, `latest` ([_Dockerfile_](https://github.com/mackoj/swaggen-docker/blob/v4.2.0/Dockerfile))
* `4.2.0` ([_Dockerfile_](https://github.com/mackoj/swaggen-docker/blob/v4.2.0/Dockerfile))

## Usage

```bash
# Pull this image
docker pull hawkci/swaggen

# Run swaggen
#   - This assumes your spec file is in $(pwd)/spec.json
#   - Generated code will be available in $(pwd)/swaggen-output
docker run                 \
  --rm                     \
  -v "$(pwd):/tmp/workdir" \
  hawkci/swaggen           \
  swaggen generate         \
  /tmp/workdir/spec.json   \
  --destination /tmp/workdir/swaggen-output
```

The project is a fork of [mithun](https://github.com/mithun)([swaggen-docker](https://hub.docker.com/r/mayachit/swaggen)) without his orignal project I wouldn't be able to build this.
