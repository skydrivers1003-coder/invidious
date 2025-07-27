FROM quay.io/invidious/invidious:latest

COPY start.sh /start.sh

CMD ["/start.sh"]
