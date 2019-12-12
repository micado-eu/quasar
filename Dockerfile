FROM node:10.16.0

ENV NODE_ENV=dev

RUN npm install -g @quasar/cli \
    && install -d -m 0755 -o node -g node /code
 
# make the 'code' folder the current working directory
WORKDIR /code
 
EXPOSE 8080 8000 80

USER node
