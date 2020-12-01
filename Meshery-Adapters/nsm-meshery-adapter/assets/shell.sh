#!/bin/bash

sleep 20s

cd $HOME && minikube start 

if [ -e $HOME/.kube/config ]
then
    echo "minikube installed"
else
    echo "Error. Restarting process"
    cd $HOME && minikube start
fi

cd $HOME/.kube && kubectl config view --minify --flatten > config.yaml && mv config.yaml config

echo "Your environment has been set up with a Minikube cluster. You may now begin the tutorial"