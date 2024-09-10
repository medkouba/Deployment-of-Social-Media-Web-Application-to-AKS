# Base stage
FROM node:18 AS base

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Development stage
FROM base AS dev
EXPOSE 3000
CMD ["npm", "start"]


FROM  base as build 

RUN npm run build

# Production stage
FROM ubuntu:18.04 AS prod

# Install Nginx and Certbot
RUN apt update -y \
    && apt install nginx -y \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:certbot/certbot -y \
    && apt-get update -y \
    && apt-get install python-certbot-nginx -y \
    && apt-get clean

RUN rm /etc/nginx/sites-enabled/default
RUN rm /var/www/html/*

COPY --from=build /app/build /var/www/html

WORKDIR /app

# Copy the Nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf  

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
