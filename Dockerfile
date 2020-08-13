FROM linuxserver/code-server:latest

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL build_version="adrius version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="adrius"

# environment settings
ENV HOME="/config"

RUN \
#  echo "**** install node repo ****" && \
#  apt-get update && \
#  apt-get install -y \
# 	gnupg && \
#  curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
#  echo 'deb https://deb.nodesource.com/node_12.x bionic main' \
# 	> /etc/apt/sources.list.d/nodesource.list && \
#  curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#  echo 'deb https://dl.yarnpkg.com/debian/ stable main' \
# 	> /etc/apt/sources.list.d/yarn.list && \
#  echo "**** install build dependencies ****" && \
#  apt-get update && \
#  apt-get install -y \
# 	build-essential \
# 	libx11-dev \
# 	libxkbfile-dev \
# 	libsecret-1-dev \
# 	pkg-config && \
 echo "**** install dotnet-core ****" && \
 curl -s https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb | dpkg -i && \
 sudo apt-get update; \
 sudo apt-get install -y apt-transport-https && \
 sudo apt-get update && \
 sudo apt-get install -y dotnet-sdk-3.1 && \
 echo "**** clean up ****" && \
 apt-get purge --auto-remove -y \
	build-essential \
	libx11-dev \
	libxkbfile-dev \
	libsecret-1-dev \
	pkg-config && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 8443
