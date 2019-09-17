FROM node:alpine as builder
WORKDIR /app/
COPY ./package.json ./yarn.lock /app/
RUN yarn install
COPY . /app/
RUN yarn build

FROM nginx:latest
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
