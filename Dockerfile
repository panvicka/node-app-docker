# set the base package from which we want to create out application
# version is not optional
FROM node:15
# sets working directory in the container
# all commands are run from this directory
WORKDIR /app 