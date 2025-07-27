# 直接使用官方多架構映像，無須自行編譯
FROM quay.io/invidious/invidious:latest

# 複製啟動腳本並給執行權限
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Render 會自動注入 $PORT，執行入口在 start.sh
CMD ["/start.sh"]
]

