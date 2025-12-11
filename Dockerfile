FROM node:20-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy and set up scripts for runtime config generation
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY generate-config.sh /usr/local/bin/generate-config.sh
RUN chmod +x /docker-entrypoint.sh /usr/local/bin/generate-config.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]

