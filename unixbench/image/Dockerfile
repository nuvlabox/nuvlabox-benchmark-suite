FROM debian

RUN apt-get update && apt-get install -y gcc libx11-dev libgl1-mesa-dev libxext-dev perl perl-modules make git

RUN git clone https://github.com/kdlucas/byte-unixbench.git /opt

WORKDIR /opt/UnixBench/

CMD ["./Run"]


