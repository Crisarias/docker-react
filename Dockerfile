#Use an existing docker image as a base
FROM node:alpine as builder
#Copy files
WORKDIR /app
COPY package.json .
#Download and install a dependency
RUN npm install
#Copy files
COPY . .
#Build the production dist
RUN npm run build

#Start the production server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html