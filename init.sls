# (prometheus-)node_exporter

security_logging:
  pkgrepo.managed:
    - baseurl: http://download.opensuse.org/repositories/security:/logging/SLE_12_SP2
    - refresh: True

refresh-suse-manager-repos:
  cmd.run:
    - name: zypper --non-interactive --gpg-auto-import-keys refresh

node_exporter:
  pkg.installed:
    - name: golang-github-prometheus-node_exporter

/etc/sysconfig/prometheus-node_exporter:
  file.managed:
    - source: salt://node_exporter/prometheus-node_exporter
    - makedirs: True

node_exporter_service:
  service.running:
    - name: prometheus-node_exporter
    - enable: True
    - require:
      - pkg: node_exporter
      - file: /etc/sysconfig/prometheus-node_exporter

# firewall
# ...
