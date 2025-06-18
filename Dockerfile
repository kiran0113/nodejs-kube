# Use official Node.js LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app source
COPY . .

# Optional: Build the app (if using TypeScript or similar)
RUN npm run build

# Default environment variable to avoid crashing on undefined paths
ENV NODE_ENV=production
ENV SOME_PATH=./public/index.html

# Tell Docker which port the app listens on
EXPOSE 3000

# Run the app
CMD ["node", "dist/index.js"]
