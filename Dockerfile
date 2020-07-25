# Use unnamed builder instead
# FROM node:alpine as builder
FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# if named builder COPY --from=builder
COPY --from=0 /app/build /usr/share/nginx/html

# Run
# docker build -t bryanfoong/frontend .
# docker run -p 8080:80 bryanfoong/frontend