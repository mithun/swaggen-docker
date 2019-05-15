# swaggen-docker

Unofficial Docker image for [SwagGen](https://github.com/yonaskolb/SwagGen)

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
