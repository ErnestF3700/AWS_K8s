helm upgrade --install kube-prometheus-stack \
prometheus-community/kube-prometheus-stack \
-n monitoring \
--create-namespace \
-f monitoring/values.yaml
