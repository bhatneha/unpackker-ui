FROM node:lts-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /app/infrastructure/nginx.conf /etc/nginx/nginx.conf
WORKDIR /code
COPY --from=builder /app/dist .
CMD ["nginx", "-g", "daemon off;"]