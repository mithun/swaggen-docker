. ./env.sh

docker login
docker tag	${DOCKER_USER}/${DOCKER_PROJECT}:${DOCKER_VERSION} ${DOCKER_USER}/${DOCKER_PROJECT}:latest
docker push ${DOCKER_USER}/${DOCKER_PROJECT}:${DOCKER_VERSION}
docker push ${DOCKER_USER}/${DOCKER_PROJECT}:latest
