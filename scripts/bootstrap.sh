# install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 
chmod 700 get_helm.sh 
./get_helm.sh
# define project namespace
kubectl apply -f /vagrant/manifests/namespace.yml 
kubectl config set-context --current --namespace=mission
# install ingress controller
helm repo add nginx-stable https://helm.nginx.com/stable 
helm repo update 
helm install elad-ingress nginx-stable/nginx-ingress
# apply deployment
kubectl apply -f /vagrant/manifests/deployment.yml
# apply service
kubectl apply -f /vagrant/manifests/service.yml