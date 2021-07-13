FROM alpine
COPY . /converter
RUN chmod +x /converter/*
WORKDIR /converter
RUN apk update && apk add wget rename -y

ENV ghost_server_domain=localhost:2368
ENV ghost_live_domain=your-domain.com
CMD ./build_static_website.sh