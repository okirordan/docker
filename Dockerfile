FROM node:alpine as builder

WORKDIR package.json .
RUN npm install --only=dev && npm install && npm run build
COPY . .
RUN npm run build

FROM nginx

COPY --from=builder  /app/build /usr/share/nginx/html