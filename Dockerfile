###############################################################################
# DOCKERFILE FOR swaggen
###############################################################################

# -----------------------------------------------------------------------------
# BUILD STAGE
# -----------------------------------------------------------------------------

FROM "${SWIFT_VERSION}" as builder

RUN apt-get update && apt-get install -y curl

ARG SWAGGEN_VERSION
ARG MAINTAINER
ARG SWAGGEN_REPO
ENV SWAGGEN_ARCHIVE="${SWAGGEN_REPO}/archive/${SWAGGEN_VERSION}.tar.gz"
RUN curl -LSs --fail -o /tmp/swaggen.tgz -- "${SWAGGEN_ARCHIVE}" \
    && cd /tmp                                                   \
    && tar -xzf swaggen.tgz                                      \
    && mv "./SwagGen-${SWAGGEN_VERSION}" ./swaggen               \
    && cd /tmp/swaggen                                           \
    && make install PREFIX=/tmp/swaggen-install

# -----------------------------------------------------------------------------
# RUN STAGE
# -----------------------------------------------------------------------------

FROM "${SWIFT_VERSION}"
LABEL maintainer="${MAINTAINER}"
LABEL Description="Docker image for ${SWAGGEN_REPO}"

COPY --from=builder /tmp/swaggen-install/ /usr/local/

COPY Dockerfile /Dockerfile
COPY LICENSE /LICENSE
COPY VERSION /VERSION

RUN chmod +x /usr/local/bin/swaggen

###############################################################################
