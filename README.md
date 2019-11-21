# swaggen-docker

Unofficial Docker image for [SwagGen](https://github.com/yonaskolb/SwagGen)

## Available Tags

* `4.3.0`, `latest` ([_Dockerfile_](https://github.com/mithun/swaggen-docker/blob/v4.3.0/Dockerfile))
* `4.2.0` ([_Dockerfile_](https://github.com/mithun/swaggen-docker/blob/v4.2.0/Dockerfile))
* `4.1.0` ([_Dockerfile_](https://github.com/mithun/swaggen-docker/blob/v4.1.0/Dockerfile))

## Usage

```bash
# Pull this image
docker pull mayachit/swaggen

# Run swaggen
#   - This assumes your spec file is in $(pwd)/spec.json
#   - Generated code will be available in $(pwd)/swaggen-output
docker run                 \
  --rm                     \
  -v "$(pwd):/tmp/workdir" \
  mayachit/swaggen         \
  swaggen generate         \
  /tmp/workdir/spec.json   \
  --destination /tmp/workdir/swaggen-output
```

* * *
