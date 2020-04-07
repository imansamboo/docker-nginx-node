#build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
#copy all because in productoion phase content doesnt change so you don't need volumes
COPY . .
RUN np run build

#/app/build <<<<======= everything we need
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html