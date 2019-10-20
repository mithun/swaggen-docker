## How To Update this project on Docker

- Go to https://github.com/yonaskolb/SwagGen/releases copy the tag in VERSION file
- configure env.sh
- run `./build.sh` this should build the docker image
- run `./test.sh` this should display the version that you have put in the VERSION file
- run `./tag.sh` this tag the version
- run `./publish.sh` this update docker hib with the docker image that you just have created


## Update your local images
```bash
docker pull hawkci/swaggen
```

## You can run the lastest and greatest swaggen version ever 😌

```bash
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
