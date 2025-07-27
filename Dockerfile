FROM docker.io/ivorg/invidious:latest

# Render 會自動注入 PORT 變數，entrypoint 會處理啟動流程
# 無需再覆蓋 CMD 或 ENTRYPOINT，保持映像原樣最穩定
