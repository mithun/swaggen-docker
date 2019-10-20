# How To Update this project on Docker

- Go to https://github.com/yonaskolb/SwagGen/releases copy the tag in VERSION file
- configure env.sh
- run `./build.sh` this should build the docker image
- run `./test.sh` this should display the version that you have put in the VERSION file
- run `./tag.sh` this tag the version
- run `./publish.sh` this update docker hib with the docker image that you just have created


```bash
# Update your local images
docker pull hawkci/swaggen
```

```bash
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
