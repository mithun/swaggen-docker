# swaggen-docker

**Unofficial Docker image** for [SwagGen](https://github.com/yonaskolb/SwagGen)

## Update process

In order to update the docker image just run `./build.sh`
If Swift or Swaggen has a new version it will create a new docker container accordingly.

This require you to have installed `swift-sh`([Github](https://github.com/mxcl/swift-sh)).

## Available Tags

* `4.3.0-slim`, `latest` ([_Dockerfile_](https://github.com/mackoj/swaggen-docker/blob/v4.3.0/Dockerfile))
* `4.2.0-slim` ([_Dockerfile_](https://github.com/mackoj/swaggen-docker/blob/v4.2.0/Dockerfile))
* `4.2.0` ([_Dockerfile_](https://github.com/mackoj/swaggen-docker/blob/v4.2.0/Dockerfile))

## Usage

```bash
# Pull this image
docker pull hawkci/swaggen:latest

declare DOCKER_MOUNTED_PATH="/tmp/workdir"

# Run swaggen
#   - This assumes your spec file is in $(pwd)/spec.json
#   - Generated code will be available in $(pwd)/swaggen-output
docker run																\
  --rm																	\
  -v "$(pwd):${DOCKER_MOUNTED_PATH}"									\
  hawkci/swaggen:latest													\
  swaggen generate "${DOCKER_MOUNTED_PATH}/spec.yml"					\
  --language swift														\
  --template "${DOCKER_MOUNTED_PATH}/Templates/Swift/template.yml"	\
  --destination "${DOCKER_MOUNTED_PATH}/Generated/Swift"			\
  --clean all															\
  --verbose
```

The project is a fork of [mithun](https://github.com/mithun)([swaggen-docker](https://hub.docker.com/r/mayachit/swaggen)) without his orignal project I wouldn't be able to build this.
