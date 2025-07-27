#!/bin/sh
# 動態組出 Invidious YAML 組態，寫入環境變數
cat > /tmp/invidious.yaml <<EOF
port: ${PORT}
check_tables: true
db_uri: "${DATABASE_URL}"
visitor_data: "${VISITOR_DATA}"
po_token: "${PO_TOKEN}"
https_only: true
external_port: 443
domain: ${INVIDIOUS_DOMAIN}
EOF

export INVIDIOUS_CONFIG="$(cat /tmp/invidious.yaml)"
exec invidious          # 官方映像已內含執行檔

