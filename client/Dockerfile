FROM node:alpine as builder
#multi-step build process starting with base image alpine
WORKDIR '/app'
#set up app work directory
COPY ./package.json ./
#copy package.json to app directory
RUN npm install
COPY . .
#copy everything else
RUN npm run build
#step that builds production front end assets
#output of this is a folder called build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#copies the default.conf file we created locally
#and overridex the default one created by the base image
#to ensure the react files will be retreived from the secondary
#NGINX server running on port 3000
#and not the default port 80 where requests come in initially
COPY --from=builder /app/build /usr/share/nginx/html
#brings over the above image to add to this image
