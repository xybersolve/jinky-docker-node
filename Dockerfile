FROM node:7-alpine

MAINTAINER Greg Milligan <xybersolve@gmail.com>

RUN apk update && \
    apk add git
