FROM node:12.14.1
LABEL maintainer "Thanaphol Pomsuwan"

# Install OpenJDK (Java) and Google Chrome

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list && \
    wget https://dl-ssl.google.com/linux/linux_signing_key.pub && \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add linux_signing_key.pub && \
    apt-get -qq update && \
    apt-get -qq install -o=Dpkg::Use-Pty=0 -t jessie-backports \
      openjdk-8-jdk \
      google-chrome-stable -y && \
    rm -rf /var/lib/apt/lists/*