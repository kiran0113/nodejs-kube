# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Then copy the rest of the code
COPY . .

# Optional: Build step (if using TS or bundling)
# RUN npm run build

# Set environment variable
ENV CONFIG_PATH=/app/config.json

# Expose the port
EXPOSE 3000

# Start the app
CMD ["node", "dist/index.js"]
