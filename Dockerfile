### BUILD TIME

# set the base package from which we want to create out application
# version is not optional
FROM node:15
# sets working directory in the container
# all commands are run from this directory
WORKDIR /app 
# copy package.json, the . is now /app 
# docker works with layers, every command is a layer... if something changes, all the layers afterwards has to rebuild
# copy first so the docker doesnt have to rebuild everytime something changes in our code
# this way it will only rebuild if a change in package.json happens
COPY package.json .
RUN npm install
# copy the rest of the files 
COPY . ./
# this is only for documentation more or less
EXPOSE 3000


### RUN TIME 
CMD ["npm", "run", "dev"]