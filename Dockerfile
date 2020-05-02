FROM node:12-alpine

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

EXPOSE 5678
CMD ["node", "src/index.js"]
