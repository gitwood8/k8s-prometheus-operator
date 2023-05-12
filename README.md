# k8s-prometheus-operator

Create cluster using:
eksctl create cluster -f eks-config/launch-cluster.yaml

Renew kubeconfig to use local Lens:
aws eks update-kubeconfig --name wood8

Install argoCD:

----- Argo CD Deploy for Windows -----
==================================

----- Execute Installation -----
----------------------
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

----- Forward port  -----
----------------------
kubectl port-forward svc/argocd-server -n argocd 8080:443
#open another terminal
localhost:8080

To LogIn install CLI
----------------------
echo $version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo-cd/releases/latest).tag_name  
$url = "https://github.com/argoproj/argo-cd/releases/download/v2.6.7/argocd-windows-amd64.exe"  
$output = "argocd.exe"  

Invoke-WebRequest -Uri $url -OutFile $output

----- Get passworf for UI -----
----------------------
argocd admin initial-password -n argocd
