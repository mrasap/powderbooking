kubectl apply -f prerequisites.yaml
helm init --service-account tiller --history-max 200

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.9/deploy/manifests/00-crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install --name cert-manager --namespace cert-manager jetstack/cert-manager

helm repo update
helm dependencies update