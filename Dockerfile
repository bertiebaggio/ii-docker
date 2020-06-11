# ii (tiny IRC client from suckless.org)
#
# VERSION 0.5


FROM alpine:3.11 as builder
LABEL upstream_url=https://tools.suckless.org/ii/
RUN apk update && apk add --no-cache git musl-dev make gcc
RUN git clone https://git.suckless.org/ii
WORKDIR /ii
RUN make

FROM alpine:3.11 as iibin
# ** Change these to suit **
ENV SERVER=irc.freenode.net FULLNAME="Dockerised ii Instance" NICK=iidocker IIDIR=/ii-io
COPY --from=builder /ii/ii /usr/local/bin/ii

# run-ii.sh taken frpom example at https://tools.suckless.org/ii/bots/
# reconnects on loss
ADD run-ii.sh /usr/local/bin/

ENTRYPOINT ["sh", "-c", "/usr/local/bin/run-ii.sh"]
