#!/bin/sh
# ------------------------------------------------------------
# start.sh – Render 專用啟動腳本
# ------------------------------------------------------------
# • 將 Render 注入的環境變數組合成 invidious.yaml
# • 重點：db 區段只保留 uri，避免預設 host 衝突
# ------------------------------------------------------------

cat > /tmp/invidious.yaml <<EOF
port: ${PORT}
check_tables: true

db:
  uri: "${DATABASE_URL}"

visitor_data: "${VISITOR_DATA}"
po_token: "${PO_TOKEN}"

https_only: true
external_port: 443
domain: ${INVIDIOUS_DOMAIN}
EOF

# 將組態導出為單行，交由 Invidious 解析
export INVIDIOUS_CONFIG="$(cat /tmp/invidious.yaml)"

# 進入程式
exec invidious

