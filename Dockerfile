FROM quay.io/invidious/invidious:latest

# 安裝依賴並建構 invidious binary
RUN shards install && \
    crystal build src/invidious.cr --release

# 啟動指令
CMD ["./invidious"]
