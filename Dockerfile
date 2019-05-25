#Pull Node.js docker container
FROM node:latest

#Set Environment
ENV NODE_ENV=production
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

#Install Tini to resolve SIGTERM issue with Node
##Following taken straight from https://github.com/krallin/tini#using-tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
##End 3rd Party Code

#Add nano, vim, and zip for convenience
RUN apt-get update && apt-get install nano vim zip -y

#Trickery to attempt to get permissions right
RUN groupmod -g 500 node && usermod -u 500 node
RUN mkdir -p /home/node/FVTT && chown -R node:node /home/node
WORKDIR /home/node/FVTT

#Dependencies
COPY package*.json ./
USER node
RUN npm install

#Copy Source
COPY --chown=node:node . .

##Start
EXPOSE 30000
CMD [ "node", "main.js", "--headless" ]


#References:
##https://www.digitalocean.com/community/tutorials/how-to-build-a-node-js-application-with-docker
