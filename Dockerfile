###############################################################################
# DOCKERFILE FOR swaggen
###############################################################################

# -----------------------------------------------------------------------------
# BUILD STAGE
# -----------------------------------------------------------------------------

FROM swift:5.0.1 as builder

RUN apt-get update && apt-get install -y curl

ARG SWAGGEN_VERSION
# ENV SWAGGEN_ARCHIVE="https://github.com/yonaskolb/SwagGen/archive/${SWAGGEN_VERSION}.tar.gz"
ENV SWAGGEN_ARCHIVE="https://github.com/mackoj/SwagGen/tarball/patch-5"
RUN curl -LSs --fail -o /tmp/swaggen.tgz -- "${SWAGGEN_ARCHIVE}" \
    && cd /tmp                                                   \
    && tar -xzf swaggen.tgz                                      \
    && mv "./SwagGen-${SWAGGEN_VERSION}" ./swaggen               \
    && cd /tmp/swaggen                                           \
    && make install PREFIX=/tmp/swaggen-install

# -----------------------------------------------------------------------------
# RUN STAGE
# -----------------------------------------------------------------------------

FROM swift:5.0.1
LABEL maintainer="Mithun Ayachit <m0t0rbr3th@gmail.com>"
LABEL Description="Unofficial Docker image for https://github.com/yonaskolb/SwagGen"

COPY --from=builder /tmp/swaggen-install/ /usr/local/

COPY Dockerfile /Dockerfile
COPY LICENSE /LICENSE
COPY VERSION /VERSION

RUN chmod +x /usr/local/bin/swaggen

###############################################################################
