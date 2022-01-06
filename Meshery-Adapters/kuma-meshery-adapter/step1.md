This lab starts by initializing a Kuberentes cluster, which may take a few moments to be available. You can check on your cluster availability by executing:

`kubectl get nodes`{{execute}}

Once ready, you can deploy Meshery.

## Setup Meshery

Meshery can be downloaded, installed, and launched with a single command:

`curl -L https://git.io/meshery | ADAPTERS=kuma PLATFORM=kubernetes bash -`{{execute}}

**Congratulations!** You have successfully installed Meshery and the Meshery Adapter for Kuma.

Meshery is now available at host:`9081`.

><font size=2>NOTE: If you see a vim page please press `q` and `y`. Also if you see an error stating `Failed to open Meshery in browser, please point your browser to....` please ignore it. </font>

To know that the Meshery has loaded with all the components connected, run 

`mesheryctl system status`{{execute}}.

 If all the components are in ready state you can open Mehsery UI tab with everything connected.

Find the **Meshery UI** tab which is configured to be listening at `http://localhost:9081`/

- Click on new tab icon the **Meshery UI** tab
- Click on **Display Port** 

**Welcome to Meshery!**

Choose **Meshery** as your provider. Sign in to get started.

![Meshery landing page](./assets/starting-page.png)

## Connect your cluster with Meshery

Meshery will auto-connect with your Kubernetes by loading the kubeconfig found in your `$HOME/.kube` folder.

**Verify your connections**


1. Between Meshery and Kubernetes.

2. Between Meshery and the Meshery Adapter for your corresponding service mesh.

![Meshery connected with adapter](./assets/kuma-connected.png)
