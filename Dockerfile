FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
FROM node:18-alpine
COPY --from=builder /app /app
WORKDIR /app
EXPOSE 8080
CMD ["npm", "start"]
