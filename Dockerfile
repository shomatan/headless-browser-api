FROM node:9.2-alpine

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        dumb-init

WORKDIR /app

COPY package.json package-lock.json ./

RUN set -xe \
    && npm install \
    && npm cache clean --force

COPY bin/    ./bin
COPY public/ ./public
COPY routes/ ./routes
COPY views/  ./views
COPY app.js  ./

EXPOSE 3000

ENTRYPOINT [ "dumb-init" ]
CMD [ "npm", "start" ]