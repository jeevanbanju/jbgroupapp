# Stage 1: Build Angular app
FROM node:16.20.2 as build

WORKDIR /app

# Copy the package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally (if not already installed)
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the entire Angular app source code to the working directory
COPY . .

# Build the Angular app for production
RUN ng build

# Stage 2: Serve the Angular app using Nginx
FROM nginx:latest

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy the production-ready Angular build from the 'build' stage to the Nginx web server directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the default HTTP port for Nginx
EXPOSE 80

# The Nginx container will automatically start serving the Angular app
