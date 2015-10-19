cd /app/ && curl -O http://file.mackerel.io/agent/tgz/mackerel-agent-latest.tar.gz && tar xvfz mackerel-agent-latest.tar.gz
sh << SCRIPT
cat >/app/mackerel-agent/mackerel-agent.conf <<'EOF';
pidfile = "/app/mackerel-agent/mackerel-agent.pid"
root = "/app/mackerel-agent"
verbose = true
apikey = "9pPrfeGDpAy75pUrC3NYii3YSH8vZ2CGu5L7sWrBuUtV"

[host_status]
on_start = "working"
on_stop  = "poweroff"
EOF
SCRIPT
echo >> /app/mackerel-agent/mackerel-agent.conf
trap '/app/mackerel-agent/mackerel-agent retire -conf /app/mackerel-agent/mackerel-agent.conf -force' TERM
cat /app/mackerel-agent/mackerel-agent.conf
/app/mackerel-agent/mackerel-agent -conf /app/mackerel-agent/mackerel-agent.conf -v &
node index.js
