FROM node:14.21.3

ENV NODE_ENV=dev

RUN true \
    && npm install -g @quasar/cli@1.1.2 \
    && install -d -m 0755 -o node -g node /code \
    && true
 
# make the 'code' folder the current working directory
WORKDIR /code
 
EXPOSE 8080 8000 80

USER node
