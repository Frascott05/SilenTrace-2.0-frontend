FROM node:20-alpine AS builder

WORKDIR /app
COPY . .

WORKDIR /app/frontend
RUN npm install
RUN npm run build


EXPOSE 5173
