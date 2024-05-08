FROM node:20-bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    ffmpeg \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

RUN git clone https://gitlab.com/Shinobi-Systems/Shinobi.git /opt/shinobi
WORKDIR /opt/shinobi
RUN npm install && npm install pm2 -g

WORKDIR /home/Shinobi

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
