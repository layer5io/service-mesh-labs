
This session has minikube pre-installed and set up for you. 

- Run Minikube
`minikube start`{{execute}}
- Check up on your minikube nodes:
`kubectl get nodes`{{execute}}

## Set up Meshery

`curl -L https://git.io/meshery | bash -`{{execute}}

**Congratulations!**
You have successfully installed Meshery. Let's get meshing.

Meshery is auto launched at port:`9081`. 
Make your way to the Meshery Server tab. For this tutorial, the server is configured to be listening at `http://localhost:9081`

**Welcome to Meshery!**

Choose `Meshery` as your provider for now and get started.
![Meshery landing page](./assets/server-page.png)

Sign up and start meshing around!
![Sign up page](./assets/login-page.png)

Meshery attempts to automatically connect with your Kubernetes cluster by loading the kubeconfig found in your `$HOME/.kube` folder and connecting existing service mesh adapters. 
In case it fails to auto detect your kubeconfig because it is stored in a different location: follow these steps to get you kube config file loaded:

 - Login to Meshery. Under your user profile, click `Get Token`.
 - Use mesheryctl to configure Meshery to use minikube. Execute:

`mesheryctl system config minikube -t ~/Downloads/auth.json`{{execute}}