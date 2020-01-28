FROM node:12.14.1
LABEL maintainer "Thanaphol Pomsuwan"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable openjdk-8-jdk xfonts-utils xfonts-intl-asian && \
  mkfontscale && mkfontdir && fc-cache && \
  rm -rf /var/lib/apt/lists/*