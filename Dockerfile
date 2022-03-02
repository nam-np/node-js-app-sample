FROM node:9 AS base

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copying rest of the application to app directory
COPY . /app
# Expose the port and start the application
#Expose 8080
RUN ls

FROM node:9-alpine
WORKDIR /app_new
COPY --from=base app/ /app_new
RUN ls
Expose 8080

HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1

CMD ["npm","start"]
