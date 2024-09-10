# Base stage
FROM node:18 AS base

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Development stage
FROM base AS dev

RUN npm install --only=development

EXPOSE 8085
CMD ["npx", "nodemon", "index.js"]

# Production stage
FROM base AS prod

EXPOSE 8085
RUN npm install --only=production

CMD ["node", "index.js"]
