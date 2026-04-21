# Make temporary build container.
FROM hugomods/hugo:latest AS builder

# cd into working directory.
WORKDIR /site

# Copy Hugo source into working directory.
COPY . .

# Set base url for website. TODO: update this.
ARG BASE_URL=http://localhost/

# Builds site into public/ folder.
RUN hugo --minify -b "${BASE_URL}"

# Start nginx container.
FROM nginx:alpine

# Copy built site from Hugo container to nginx container.
COPY --from=builder /site/public /usr/share/nginx/html

# Listen on port 80.
EXPOSE 80