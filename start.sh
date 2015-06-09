sh << SCRIPT
cat >/app/mackerel-agent/mackerel-agent.conf <<'EOF';
pidfile = "/app/mackerel-agent/mackerel-agent.pid"
root = "/app/mackerel-agent"
verbose = true
apikey = "<APIKEY>"
EOF
SCRIPT
echo >> /app/mackerel-agent/mackerel-agent.conf
cat /app/mackerel-agent/mackerel-agent.conf
/app/mackerel-agent/mackerel-agent -conf /app/mackerel-agent/mackerel-agent.conf -v &
node index.js
