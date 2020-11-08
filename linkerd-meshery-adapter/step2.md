Linkerd can be installed on Meshery with one click! 

## 1. Select `Linkerd` from the Management menu

![Meshery adapter for Linkerd](./assets/linkerd-adapter.png)

## 2. In the Linkerd management page:

- Type `linkerd` into the namespace field
- Click the (+) icon on the Install card and select `Latest Linkerd` to install the latest version of Istio

![Install Linkerd using Meshery](./assets/install-linkerd.png)

You can verify the successful installaion of Linkerd on your Meshery instance by running:
`linkerd check`{{execute}}