FROM fedora
RUN dnf install -y \
    gcc \
    python \
    iproute \
    pip\
    git

RUN pip install bindep

RUN adduser \
    -d /home/zuul \
    -m \
    -u 1000 \
    -U \
    zuul

RUN echo "zuul ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/zuul

USER zuul
WORKDIR /home/zuul
