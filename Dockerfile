FROM quay.io/invidious/invidious:latest

COPY start.sh /start.sh

USER root
RUN chmod +x /start.sh
USER invidious

CMD ["/start.sh"]
