FROM golang

ARG YQ=v4.6.0
ARG KUBEBUILDER=v3.8.0
ARG KUSTOMIZE=v4.5.7

ENV DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        jq \
        make \
        openssh-client \
        unzip \
    && \
    curl -sL https://github.com/mikefarah/yq/releases/download/$YQ/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    mkdir -p /usr/local/kubebuilder && \
    curl -sL https://github.com/kubernetes-sigs/kubebuilder/releases/download/${KUBEBUILDER}/kubebuilder_linux_amd64 -o /usr/local/bin/kubebuilder && \
    chmod +x /usr/local/bin/kubebuilder && \
    curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE}/kustomize_${KUSTOMIZE}_linux_amd64.tar.gz | tar xzC /usr/bin/ && \
    chmod +x /usr/bin/kustomize && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
ENV PATH=${PATH}:/usr/local/kubebuilder/bin
