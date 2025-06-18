FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Enable this if your project has a build step
RUN npm run build

ENV CONFIG_PATH=/app/config.json

EXPOSE 3000

CMD ["node", "dist/index.js"]
