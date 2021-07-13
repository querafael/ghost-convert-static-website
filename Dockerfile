FROM ubuntu:bionic
COPY . /converter
RUN chmod +x /converter/*
WORKDIR /converter
RUN apt update && apt install wget rename -y

ENV ghost_server_domain=localhost:2368
ENV ghost_live_domain=your-domain.com
CMD ./build_static_website.sh