# Use Node.js LTS as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the full source code
COPY . .

# Optional: build step (if you're using TypeScript or bundling)
# RUN npm run build

# Set environment variable (optional fallback)
ENV CONFIG_PATH=/app/config.json

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "dist/index.js"]
