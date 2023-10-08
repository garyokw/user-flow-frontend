# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Vue.js application
RUN npm run build -t user-flow-frontend:v0.1 .

# Expose port 80 for the web server
EXPOSE 8080

# Define the command to start the web server
CMD [ "npm", "run", "start" ]
