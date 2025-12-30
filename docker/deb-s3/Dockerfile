FROM ubuntu:22.04
RUN apt update && apt install -y curl lsb-release gnupg
RUN echo "deb http://deb-s3-repo.s3.us-east-2.amazonaws.com/$(lsb_release -is | tr A-Z a-z)/ $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/deb-s3.list
RUN curl -so /etc/apt/trusted.gpg.d/deb-s3-archive-keyring.gpg https://raw.githubusercontent.com/deb-s3/deb-s3/master/deb-s3-archive-keyring.gpg
RUN apt update && apt install -y deb-s3
ENTRYPOINT ["deb-s3"]
