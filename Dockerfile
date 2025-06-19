# Use Node.js LTS as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# 🔁 Copy full source before build
COPY . .

# Run Vite build
RUN npm run build

# Optional: Set environment variable (if used in app)
ENV CONFIG_PATH=/app/config.json

# Expose app port
EXPOSE 3000

# Run your Node.js app
CMD ["node", "dist/index.js"]
