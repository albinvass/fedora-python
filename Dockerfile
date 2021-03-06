FROM fedora
RUN dnf install -y \
    gcc \
    python \
    iproute \
    pip\
    git

RUN pip install bindep

ENV CARGO_HOME=/usr
ENV RUSTUP_HOME=/usr
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain stable

RUN adduser \
    -d /home/zuul \
    -m \
    -u 1000 \
    -U \
    zuul

RUN echo "zuul ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/zuul

USER zuul
WORKDIR /home/zuul
