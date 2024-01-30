# Stage 1 - Build the React app.
# node14 base image, name the stage in multi-stage build, work directory, copy files and build.
FROM node:14 AS build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# Stage 2 - Serve the React app
# nginx:alpine base image, copy the built pages into nginx default folder, and serve.
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
