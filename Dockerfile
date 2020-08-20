FROM busybox:latest
RUN touch cc
RUN touch dd
RUN touch xxxxxxxxxxxxxxxxxxxxx
LABEL name="Photon OS x86_64/3.0 Base Image" \
    vendor="VMware" \
    build-date="20200814"

