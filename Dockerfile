FROM ubuntu:24.04
ENV AMNEZIA_PROTOCOL=AmneziaWG OBFUSCATE=true
# Install dependencies
RUN apt-get update && apt-get install -y \
    curl wget unzip iptables iproute2 wireguard-tools \
    && rm -rf /var/lib/apt/lists/*

# Install Amnezia server (using official GitHub script)
RUN curl -fsSL https://raw.githubusercontent.com/amnezia-vpn/amnezia-server/main/install.sh | bash

# Expose VPN port (UDP for WireGuard/AmneziaWG)
EXPOSE 51820/udp

# Health check endpoint (for Render pings)
EXPOSE 80/tcp
RUN echo "OK" > /health && chmod +r /health

# Start the server (Amnezia entrypoint)
CMD ["/usr/local/bin/amnezia-server", "start"]
