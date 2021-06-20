FROM debian:stable
LABEL maintainer="David Gilman <davidgilman1@gmail.com>"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Installs the `dpkg-buildpackage` command
RUN apt-get update && apt-get -y upgrade && apt-get -y install python3-pip dpkg-dev apt-utils gpg git python3-apt
RUN pip3 install git+https://github.com/dgilman/github-apt-repos.git@1aa2fee1389ddac4d6f5106dc262f27af997f07d

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
