# prometeo
prometheus experiments for learning

## blackbox exporter

```bash
docker pull prom/blackbox-exporter
docker run -d -p 9115:9115 --name blackbox-exporter -v `pwd`:/config prom/blackbox-exporter --config.file=/config/blackbox.yml
```

## Grafana

goto dir grafana
