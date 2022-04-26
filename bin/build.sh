helm package -d charts source/simple-helm-chart/
helm repo index --merge index.yaml .
