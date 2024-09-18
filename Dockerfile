FROM kalilinux/kali-rolling

# Required Arguments
ARG COBALTSTRIKE_LICENSE

# Install all dependencies
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get install -y gnupg 
RUN apt-get update && \
        apt-get install --no-install-recommends -y \
        ca-certificates \
        expect \
        openjdk-11-jdk \ 
        curl && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
        update-java-alternatives -s java-1.11.0-openjdk-amd64
RUN apt-get update && apt-get install -y iproute2


# Install and update Cobalt Strike
RUN echo "COBALTSTRIKE_LICENSE: ${COBALTSTRIKE_LICENSE}" && \
  export TOKEN=$(curl -s https://download.cobaltstrike.com/download -d "dlkey=${COBALTSTRIKE_LICENSE}" | grep 'href="/downloads/' | cut -d '/' -f3,4) && \
        cd /opt && \
        curl -s https://download.cobaltstrike.com/downloads/${TOKEN}/cobaltstrike-dist-linux.tgz -o cobaltstrike-dist-linux.tgz && \
        tar zxf cobaltstrike-dist-linux.tgz && \
        rm /etc/ssl/certs/java/cacerts && \
        update-ca-certificates -f && \
        cd /opt/cobaltstrike && \
        echo ${COBALTSTRIKE_LICENSE} | ./update && \
        mkdir /opt/cobaltstrike/mount


# Expose ports and run it
WORKDIR /opt/cobaltstrike/server 
EXPOSE 50050 80 443 4443 4444 4445 4446 4447 4448 4449 9050 9051 9053 9054 9055 9056 53/udp
ENTRYPOINT ["./teamserver"]
