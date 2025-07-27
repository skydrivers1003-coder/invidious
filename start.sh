#!/bin/sh
# ------------------------------------------------------------
# start.sh – Render 專用啟動腳本（修正版）
# ------------------------------------------------------------
# • 將 Render 注入的環境變數組合成 invidious.yaml
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

# Debug 印出 path 和 binary 位址
echo "PATH is: $PATH"
echo "Which invidious: $(which invidious)"
ls -l /usr/bin/invidious || true
ls -l /app/invidious || true

# 執行 invidious（建議先測試 /usr/bin）
exec /usr/bin/invidious
