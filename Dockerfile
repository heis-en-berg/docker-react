# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
CMD ['npm', 'run', 'build']

# Run phase
# build folder will be created in the working directory
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html