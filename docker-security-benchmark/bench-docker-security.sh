#!/bin/sh -e

[ ! -d /tmp/docker-bench-security-master ] && (wget https://github.com/docker/docker-bench-security/archive/master.zip -O /tmp/master.zip && \
        unzip /tmp/master.zip -d /tmp)

cd /tmp/docker-bench-security-master

image_id=$(docker build . -q)

# Linux only
docker run -it --net host --pid host --userns host --cap-add audit_control \
    -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /etc:/etc:ro \
    -v /lib/systemd/system:/lib/systemd/system:ro \
    -v /usr/bin/containerd:/usr/bin/containerd:ro \
    -v /usr/bin/runc:/usr/bin/runc:ro \
    -v /usr/lib/systemd:/usr/lib/systemd:ro \
    -v /var/lib:/var/lib:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --label docker_bench_security \
    $image_id

rm -fr /tmp/docker-bench-security