# Route B (DEPLOY_MEMORY.md Sec.5): multi-stage, official xray image -> Alpine with shell.
# If the COPY path ever changes, entrypoint.sh still downloads the official
# release at runtime, so the image stays bootable.
# Diploi: when the component folder already exists, Diploi runs it from the
# files it finds there, so this Dockerfile (used for staging/production) is
# honoured; if the Node.js component's own Dockerfile is used instead, the
# build runs `npm install` + `npm run build` and the container runs
# `npm start` -> server.js -> entrypoint.sh. Both paths end at entrypoint.sh.
FROM ghcr.io/xtls/xray-core:v26.10.31 AS xray
FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip
COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray
WORKDIR /app
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

EXPOSE 8080
CMD ["sh", "./entrypoint.sh"]
