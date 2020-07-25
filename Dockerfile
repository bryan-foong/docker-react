FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# Run
# docker build -t bryanfoong/frontend .
# docker run -p 8080:80 bryanfoong/frontend