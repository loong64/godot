FROM ghcr.io/loong64/anolis:23

RUN : \
 && yum install --allowerasing -y \
        ca-certificates \
        curl \
        gcc-c++ \
        git \
        libatomic-static \
        libstdc++-static \
        patch \
        pkgconfig \
        scons \
        wayland-devel \
 && yum clean all \
 && :

# Clang
ARG RUNNER_ARCH
RUN : \
 && cd /opt \
 && curl -LO https://github.com/loong64/static-clang-build/raw/refs/heads/main/install-static-clang.sh \
 && bash ./install-static-clang.sh \
 && rm -f ./install-static-clang.sh \
 && :

ENV PATH="/opt/clang/bin:$PATH"

RUN git config --global --add safe.directory "*"
