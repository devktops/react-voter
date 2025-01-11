FROM node:20-alpine as builder

LABEL maintainer="Soe Thura <thixpin@gmail.com>"
LABEL description="Dockerfile for Voting App"

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine as runner

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80