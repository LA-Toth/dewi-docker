FROM python:3.9.9-slim-bullseye

ARG DEWI_COMMANDS_VERSION
ARG DEWI_CORE_VERSION
ARG DEWI_LOGPARSERS_VERSION
ARG DEWI_MODULE_FRAMEWORK_VERSION
ARG DEWI_REALTIME_SYNC_VERSION
ARG DEWI_UTILS_VERSION
ARG DEWI_VERSION

SHELL ["/bin/bash", "-c"]

RUN set -eEu && \
    mkdir /opt/dewi && \
    cd /opt/dewi && \
    apt update --yes && \
    apt upgrade --yes -o APT::Install-Suggests=0 -o APT::Install-Recommends=0 && \
    apt install --yes -o APT::Install-Suggests=0 -o APT::Install-Recommends=0 \
                      git ssh-client rsync rrdtool && \
    apt autoremove --purge --yes && \
    apt clean --yes && \
    rm -r /var/lib/apt/lists/* && \
    mkdir -p /opt/dewi-state && \
    for d in dewi_core \
             dewi_logparsers \
             dewi_module_framework \
             dewi_realtime_sync \
             dewi_utils \
             dewi_commands \
             dewi \
             ; \
    do \
        declare -u VER=${d}_VERSION && \
        git clone https://github.com/LA-Toth/$d /opt/dewi/$d; \
        cd /opt/dewi/$d && \
        git checkout ${!VER} && \
        python3 ./setup.py install && \
        echo -en "ref: ${!VER}\ncommit: " > /opt/dewi-state/$d.commit.txt && \
        git rev-parse HEAD >> /opt/dewi-state/$d.commit.txt; \
    done && \
    cd / && \
    rm -rf /opt/dewi

COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["list-all"]
