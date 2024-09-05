# Base stage
FROM node:18 AS base

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Development stage
FROM base AS development

CMD ["npm", "start"]

# Production stage
FROM base AS production

RUN npm run build

RUN npm install -g serve

CMD ["serve", "-s", "build"]
