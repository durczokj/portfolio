# Stage 1: Build with Hugo
FROM hugomods/hugo:exts-0.150.0 AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# Stage 2: Serve with Nginx
FROM nginx:1.27-alpine
COPY --from=builder /src/public /usr/share/nginx/html
RUN chmod -R a+r /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
