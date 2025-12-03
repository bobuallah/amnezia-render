FROM nokitakaze/amneziavpndockerserver:latest

EXPOSE 51820/udp
EXPOSE 5000/tcp

CMD ["/start.sh"]
