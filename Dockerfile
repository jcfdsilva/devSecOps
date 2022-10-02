#choose node version start from https://hub.docker.com/_/node
FROM node:16.17.1-buster AS build
WORKDIR /build

COPY package.json package.json
#COPY package-lock.json package-lock.json
RUN npm i 
#npm ci = npm install for continuous integration systems

COPY public/ public
COPY src/ src
RUN npm run build

#from our buid stage copy in an apache alpine container to deploy in heroku
FROM httpd:alpine
WORKDIR /usr/local/apache2/htdocs
COPY --from=build /build/build/ .
RUN chown -R www-data:www-data /usr/local/apache2/htdocs \
    && sed -i "s/Listen 80/Listen \${PORT}/g" /usr/local/apache2/conf/httpd.conf