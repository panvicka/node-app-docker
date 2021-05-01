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

# just calling RUN `npm install` installs dev dependencies also in production mode which is stupid

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

RUN npm install
# copy the rest of the files 
COPY . ./

# enviromental variable 
# but only default valus, we can overwrite them when starting container
ENV PORT 3000

# this is only for documentation more or less
EXPOSE $PORT



### RUN TIME 
# this can be overwritten by stuff in dockercompose as well 
CMD ["node", "index.js"]