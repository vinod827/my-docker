FROM node:alpine

RUN mkdir /app
WORKDIR /app

COPY package.json package.json
RUN npm install package.json

COPY . .

LABEL maintainer="Vinod Kumar Nair <vinod827@gmail.com>" \
      version="1.0.0"

CMD npm start --host=0.0.0.0 --port=8080
