FROM alpine:3.12 as web-assets
WORKDIR /assets

COPY . .

FROM abdennour/nginx-distroless-unprivileged as release
WORKDIR /usr/share/nginx/html
COPY --from=web-assets  --chown=1001:0 /assets .
EXPOSE 8080
USER 1001