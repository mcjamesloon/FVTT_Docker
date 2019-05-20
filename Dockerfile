#Pull Node.js 8 docker build
FROM node:8

#Create app directory and volume
WORKDIR /FVTT
VOLUME /FVTT

#Dependencies
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 30000

#Start Variables
CMD [ "node", "main.js", "--headless" ]
