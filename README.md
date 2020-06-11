# ii-docker - minimalist IRC client in Docker

This takes [ii](https://tools.suckless.org/ii/) and wraps it up to be used in Docker. Since ii is simple (<= 1000 lines of code) and FIFO/filesystem-based, all that is needed to run it in Docker is to compile it.
It runs on a base alpine image with no external dependencies, resulting in a tiny (~5MB) image.

ii can be used a simple IRC client, or as a basis for bots. By default, all this does is connect to a sever (irc.freenode.net by default) and will try to reconnect on connection loss. It does not join any channels or send any messages.

## Usage

1. Clone the repo:

      % git clone https://www.github/com/bertiebaggio/ii-docker

2. Update `Dockerfile` to set environment variables for server, nick, fullname and ii directory as desired (alternatively, these can be specified at run time using `-e`/`--env`/`--env-file`)

3. Build image

4. Run container

5. Use ii


## Docker Hub Image

Alternatively, you can use the Docker Hub image directly. For example

    % docker run -d bertieb/ii-docker:latest --env SERVER=irc.oftc.net --env NICK=iiuser --env FULLNAME="II USER" --name ii

Upstream ii is relatively stable. Their latest published version and tag is 1.8 from 2018; this is mapped to tag `:1.8`. There have been commits since then, and tag `:latest` pulls these in.

### Volumes

If you wish to interact with ii from outside the container, you can create a volume for the directory specified by the envirment variable `$IIDIR`, which is `/ii-io/` by default. For example:

    % docker run -d -v ./ii/:/ii-io/ bertieb/ii-docker:latest

## Credits

All development work on ii itself can be found at [the upstream repo](https://git.suckless.org/ii/). 

ii is copyright:

- 2014-2018 Hiltjo Posthuma <hiltjo at codemadness dot org>
- 2005-2006 Anselm R. Garbe <garbeam@wmii.de>
- 2005-2011 Nico Golde <nico at ngolde dot de>
