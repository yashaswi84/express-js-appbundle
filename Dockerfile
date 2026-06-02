FROM apacsoleng.jfrog.io/docker/node:18-alpine
#ARG JF_TOKEN

# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN apk add --no-cache curl make nmap-ncat

# If you are building your code for production
#RUN jf c import ${JF_TOKEN} && \
#    jf npmc --repo-resolve=fgr-npm-remote && \
#    jf npm i --omit dev
#EXPOSE 3000

COPY server.js ./
COPY public public/
COPY views views/
COPY creds.txt /usr/src/
CMD [ "node", "server.js" ]
