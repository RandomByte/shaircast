FROM node:10-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh python python-dev

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

COPY ./server.js .

ENV SHAIRCAST_GROUP_NAME="All Speakers"
ENV SHAIRCAST_ENDPOINTS="192.168.1.116,192.168.1.117"

CMD [ "npm", "start" ]