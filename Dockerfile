FROM amnezia/vpn-server:latest

EXPOSE 51820/udp
EXPOSE 5000/tcp

CMD ["/entrypoint.sh"]
