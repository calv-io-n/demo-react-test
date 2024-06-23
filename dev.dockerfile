# Use an official Node runtime as a parent image
FROM node:20-alpine

# Optionally install essential packages for native dependencies
RUN apk add --no-cache git make g++ python3

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) for better caching
COPY package*.json ./

# Install all Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application using npm
CMD ["npm", "start"]
