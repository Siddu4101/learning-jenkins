# Fedora Rawhide is the upstream of RHEL 10
FROM fedora:rawhide

LABEL maintainer="Your Name <you@example.com>"
LABEL description="Fedora Rawhide container with post-quantum crypto policies enabled (FUTURE-PQ)."

# Update system and install required tools
RUN dnf -y update && \
    dnf -y install \
        crypto-policies \
        crypto-policies-scripts \
        openssl \
        openssl-libs \
        vim \
        curl \
        wget \
        procps-ng && \
    dnf clean all

# Optional: log available crypto policies
RUN update-crypto-policies --list > /root/crypto-policies-available.txt || true

# Try enabling FUTURE-PQ if it exists, otherwise fallback to FUTURE
RUN if update-crypto-policies --list | grep -q "FUTURE-PQ"; then \
        update-crypto-policies --set FUTURE-PQ; \
    else \
        echo "FUTURE-PQ not found, falling back to FUTURE"; \
        update-crypto-policies --set FUTURE; \
    fi

# Verify what policy is active
RUN update-crypto-policies --show > /root/crypto-policy-current.txt

CMD ["/bin/bash"]
