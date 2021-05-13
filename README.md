# Welcome to my-docker basic app

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/daaac45760f243909d499bf63769be65)](https://app.codacy.com/gh/vinod827/my-docker?utm_source=github.com&utm_medium=referral&utm_content=vinod827/my-docker&utm_campaign=Badge_Grade_Settings)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/daaac45760f243909d499bf63769be65)](https://app.codacy.com/gh/vinod827/my-docker?utm_source=github.com&utm_medium=referral&utm_content=vinod827/my-docker&utm_campaign=Badge_Grade_Settings)

# Google Cloud Platform (GCP)

# Google commands (Completely optional):-
gcloud auth login
gcloud projects list
gcloud config set project <projectid>
gcloud compute instances list

# To create instances on GCP:-
gcloud compute instances create cks-master --zone=europe-west3-c \
--machine-type=e2-medium \
--image=ubuntu-1804-bionic-v20201014 \
--image-project=ubuntu-os-cloud \
--boot-disk-size=50GB

gcloud compute instances create cks-worker --zone=europe-west3-c \
--machine-type=e2-medium \
--image=ubuntu-1804-bionic-v20201014 \
--image-project=ubuntu-os-cloud \
--boot-disk-size=50GB

gcloud compute ssh cks-master
gcloud compute ssh cks-worker


# Docker commands:-

To build a docker image:-
docker build -t <image name> .
For e.g. - docker build -t myapp .

To tag an image:-
docker tag <existing image name>:<tag id> <new image name>:<tag id> 
For e.g. - docker tag myapp:latest vinod827/myapp:1.0.0
  
To push a docker image:-
docker push <image name>:<tag id>
For e.g. - docker push vinod827/myapp:1.0.0
  
To pull an image from container registry (here docker hub as an example):-
docker pull <image name>
For e.g. - docker pull nginx
           docker pull vinod827/myapp:1.0.0

Please note that if you are pushing or pulling from a private docker registry then you need to sign-in first using the docker login command

To run a conatiner on terminal:-
docker run <detached mode flag -d> <port binding flag -p> <container name is optional --name> <container name> <image>
For e.g. docker run -d -p 3000:8080  --name myapp1 vinod827/demo:3.0
         docker run -d -p 8080:80 --name mynginx nginx

To see all docker containers:-
docker ps

To exec into a running container:-
docker inspect <container id>

To stop a container:-
docker stop <container id>
  
  
  
# Kubernetes (k8s) commands :-


To create a pod:-
kubectl run <pod name> --image <image name>
For e.g. - kubectl run mynginx --image nginx

To describe a pod:-
kubectl describe pod <pod name>
For e.g. - kubectl describe pod mynginx
  
To get or see all pods:-
kubectl get pods

To delete a pod:-
kubectl delete pod <pod name>

To create a deployment:-
kubectl create deployment <deployment name> --image <image name>
kubectl create deployment mynginxdeployment --image nginx
  
To get all deployment:-
kubectl get deployment

To describe a deployment:-
kubectl describe deployment <mynginxdeployment>

To delete a deployment:-
kubectl delete deployment <deployment name>
kubectl expose pod mydocker --name mydocker-svc --port 8080 --type NodePort

To edit a deployment:-
kubectl edit deployment <deployment name>
  
To create a secret to pull image from Private Docker Container Registry:-
kubectl create secret docker-registry mydocker-registry --docker-server=<host name> \
        --docker-username=<docker username> --docker-password=<docker account password> \
        --docker-email=<email address>

For e.g. - kubectl create secret docker-registry mydocker-registry --docker-server=https://index.docker.io/v2/ \
        --docker-username=vinod827 --docker-password=XYZ \
        --docker-email=vinod827@gmail.com

To login to AWS Kubernetes account from terminal:-
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 754178572197.dkr.ecr.us-east-1.amazonaws.com

To create a Kubernetes cluster on AWS EKS:-
eksctl create cluster --name <name of cluster> --region <region name>
For e.g. - 
eksctl create cluster \
--name my-cluster \
--region us-west-2 \


To work with Kubernetes context:-
kubectl config get-contexts
kubectl config current-context

To change a context:-
kubectl config use-context <context name>
For e.g. - kubectl config use-context vinod.kumar@simpplr.com@my-cluster-demo.us-east-1.eksctl.io

To check current namespace:-
kubectl config view --minify | grep namespace:

To change a namespace:-
kubectl config set-context --current --namespace= <>

To create a configmap:-
kubectl create configmap my-app-config --from-literal=key1=config1 --from-literal=key2=config2

To create a secret:-
kubectl create secret generic mysecret --from-literal=key1=config1 --from-literal=key2=config2

