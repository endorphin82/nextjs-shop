FROM node:12

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app

# Installing dependencies

COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

RUN npm run build
#RUN rm -rf $(ls -I package.json -I .next -I config -I next.config.js -I schema.graphql -I .sequelizerc)
RUN rm -rf components models pages public

#RUN npm run build
# Running the app
EXPOSE 3000
CMD [ "npm", "run", "start" ]