# base image
FROM node:14.15

MAINTAINER ljay

# set working directory
WORKDIR /usr/src/app

# add `node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json

RUN apt-get update && npm install

# for dev only
RUN apt-get install -y vim

# start app
CMD ["npm", "run", "dev"]