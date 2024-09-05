# Base stage
FROM node:18 AS base

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Development stage
FROM base AS development

RUN npm install --only=development


CMD ["npx", "nodemon", "index.js"]

# Production stage
FROM base AS production

RUN npm install --only=production

CMD ["node", "index.js"]
