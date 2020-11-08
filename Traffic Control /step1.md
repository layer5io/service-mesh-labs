
## Install Minikube and Meshery

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


