
## Check up on your Sample Application

The virtual service and gateway needed to expose the BookInfo's productpage application in the default namespace have now been deployed. The environment will take about a minute to activate and the terminal will be activated for your use immediately after.

Before continuing to the next step, perform these verification checks to ensure that your sample app is eady to be deployed: 

- Verify that the deployments are all in a state of AVAILABLE before continuing.
  `watch kubectl get deployment`{{execute}}
- Choose a service, for instance productpage, and view it's container configuration:
  `kubectl get po`{{execute}}
- Examine details of the services:
`kubectl describe svc productpage`{{execute}}

The components deployed on the service mesh by default are not exposed outside the cluster. An Ingress Gateway is deployed as a Kubernetes service of type LoadBalancer (or NodePort). To make Bookinfo accessible external to the cluster, we have to create an `Istio-Ingress Gateway` for the Bookinfo application and also define an `Istio VirtualService` with the routes we need.

## Set up the Ingress pod

1. Expose the Ingress gateway by running:
`kubectl get svc istio-ingressgateway -n istio-system -o yaml`{{execute}}

2. Get the name of the Istio-Ingress gateway:
`kubectl get pods -n istio-system`{{execute}}

Sample Output:

| NAME                                        | READY  | STATUS     | RESTARTS |   AGE   |
|---------------------------------------------|--------|------------|----------|---------|
| istio-egressgateway-7bf76dd59-s9st6         |  1/1   |  Running   |    0     |    14m  |  
| **istio-ingressgateway-586dbbc45d-5xtpk**   |  1/1   |  Running   |    0     |    14m  |  
| istiod-6cc5758d8c-4czhc                     |  1/1   |  Running   |    0     |    14m  |  

