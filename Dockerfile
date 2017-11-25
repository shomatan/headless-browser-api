FROM shomatan/puppeteer-base

LABEL maintainer="shoma416@gmail.com"

RUN set -ex \
    && wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
    && chmod +x /usr/local/bin/dumb-init

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