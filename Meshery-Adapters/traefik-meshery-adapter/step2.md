Meshery allows you to install any service mesh with a single click:

## 1. Select `Traefik-mesh` from the Management menu

![Meshery adapter for Traefik-Mesh](./assets/traefik-mesh-adapter.png)

## 2. In the Istio management page:

- Type `traefik-system` into the namespace field
- Click the (+) icon on the Install card and select `Traefik Mesh` to install the latest version of Istio

![Install Traefik-Mesh using Meshery](./assets/install-traefik.png)

## Check for successful installation

NSM has been deployed in a separate Kubernetes namespace: nsm-system. To check if NSM is along with all the pieces that have been deployed, execute the following:

`kubectl get all -n traefik-system`{{execute}}

The details of your configuration will also be reflected on the Meshery dashboard:

