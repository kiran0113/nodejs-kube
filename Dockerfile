FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Build TypeScript project
RUN npm run build

# Set env to avoid undefined crashes
ENV NODE_ENV=production
ENV SOME_PATH=./public/index.html

EXPOSE 3000

CMD ["node", "dist/index.js"]
