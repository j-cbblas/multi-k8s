FROM node:alpine
#base image
WORKDIR "/app"
#directory in container /app
COPY ./package.json ./
#copy package.json file over to the container
RUN npm install
COPY . .
#copy everything else
CMD ["npm", "run", "start"]
#start just indicates that start is the run command at start
