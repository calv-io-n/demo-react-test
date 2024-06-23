# Stage 1: Build the React application
FROM node:20-alpine as builder
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./
# If you use yarn, uncomment the next line and delete the npm install line
# COPY yarn.lock .

# Install only production dependencies
RUN npm install --production
# For yarn, use:
# RUN yarn install --production

# Copy the rest of your application code
COPY . .

# Build the application
RUN npm run build
# For yarn, use:
# RUN yarn build


# Stage 2: Serve the application from Nginx
FROM nginx:stable-alpine
# Copy the built assets from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy Nginx configuration (if you have a custom one)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
