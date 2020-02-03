# Set version
declare REPO="yonaskolb/SwagGen"
declare LAST_SWAGGEN_VERSION="$(curl --silent "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')"
declare MAINTAINER="Jeffrey MACKO(@jeffreymacko) - Original maintainer: Mithun Ayachit <m0t0rbr3th@gmail.com>"
declare SWAGGEN_REPO="https://github.com/${REPO}"
declare DOCKER_USER="hawkci"
declare DOCKER_PROJECT="swaggen"
declare DOCKER_VERSION="${LAST_SWAGGEN_VERSION}-slim"
declare DOCKER_VERSION_ALIAS="latest"

./getLastSwiftTag.swift "apple/swift" "-RELEASE" NEW_SWIFT_VERSION

LAST_SWIFT_VERSION="$(cat NEW_SWIFT_VERSION)"
OLD_LAST_SWAGGEN_VERSION="$(cat VERSION)"
OLD_LAST_SWIFT_VERSION="$(cat LAST_SWIFT_VERSION)"
