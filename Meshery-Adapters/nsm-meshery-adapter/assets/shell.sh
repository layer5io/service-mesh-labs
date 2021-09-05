#!/bin/bash
echo "Waiting for the environment to be set up"

sleep 8s

echo "Setting up a Minikube cluster"

sleep 10s

cd $HOME && minikube start 

if [ -e $HOME/.kube/config ]
then
    echo "minikube installed"
else
    echo "Error. Restarting process"
    cd $HOME && minikube start
fi

 sleep 5s

if [ ! -f $HOME/.kube/config ]; then
    cd $HOME && minikube start 
else
    echo "Almost done..."
fi

cd $HOME/.kube && kubectl config view --minify --flatten > config.yaml && mv config.yaml config

echo "Your environment has been set up with a Minikube cluster. You may now begin the tutorial"