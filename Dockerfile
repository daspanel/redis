FROM daspanel/alpine-base
MAINTAINER Abner G Jacobsen - http://daspanel.com <admin@daspanel.com>

# Set default env variables
ENV \
    # Stop container initialization if error occurs in cont-init.d, fix-attrs.d script's
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \

    # Timezone
    TZ="UTC" \

    # Redis
    REDIS_VERSION="3.2.8"

RUN apk update && \
    apk --update --no-cache add --virtual build_deps ca-certificates gcc libressl linux-headers make musl-dev \

    # Redis
    && wget -O redis.tar.gz http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz \
    && mkdir -p /usr/src/redis \
    && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
    && rm redis.tar.gz \
    # Disable Redis protected mode [1] as it is unnecessary in context
    # of Docker. Ports are not automatically exposed when running inside
    # Docker, but rather explicitely by specifying -p / -P.
    && grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 1$' /usr/src/redis/src/server.h \
    && sed -ri 's!^(#define CONFIG_DEFAULT_PROTECTED_MODE) 1$!\1 0!' /usr/src/redis/src/server.h \
    && grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 0$' /usr/src/redis/src/server.h \
    && make -C /usr/src/redis \
    && make -C /usr/src/redis install \
    && rm -r /usr/src/redis \

    # Cleanup
    && apk del build_deps \
    && rm -rf \
        /var/cache/apk/* \
        /tmp/src \
        /tmp/*

# Inject files in container file system
COPY rootfs /

# Expose ports for the service
EXPOSE 6379



