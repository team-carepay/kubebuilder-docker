FROM golang

ARG YQ=v4.6.0
ARG KUBEBUILDER=2.3.2

ENV DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        gcc \
        git \
        jq \
        make \
        openssh-client \
        unzip \
    && \
    curl -sL https://github.com/mikefarah/yq/releases/download/$YQ/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    curl -sL https://github.com/kubernetes-sigs/kubebuilder/releases/download/v$KUBEBUILDER/kubebuilder_${KUBEBUILDER}_linux_amd64.tar.gz  | tar xzC /usr/ --strip 1 && \
    chmod +x /usr/bin/kube* /usr/bin/etcd && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

