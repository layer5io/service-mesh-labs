
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

3. Access the container

To access the container through the Istio-Ingress gateway, you can substitute the Istio-Ingress gateway name obtained as an output to the above command and run `kubectl -n istio-system exec -it <istio-ingressgateway-...> bash`

For this session, you may run:

`kubectl -n istio-system exec -it istio-ingressgateway-586dbbc45d-5xtpk bash`{{execute}}

You should now be able to access your Ingress port from within the terminal. We will be using this ability in the latter part of this session.

4. Exit out of the container, back to host with:
`exit`{{execute}}

## Apply default destination rules

We need to define the available versions of the deployed services, called subsets, in destination rules before running Bookinfo. This creates destination rules for each of the BookInfo services and defines version subsets:
Using Meshery, navigate to the `Istio management` page:

- Enter `default` in the Namespace field.
- Click the (+) icon on the Configure card and select `Bookinfo subsets` from the list.

Verify the destination rules with:
`kubectl get destinationrules`{{execute}}

`kubectl get destinationrules -o yaml`{{execute}}


## Access the Ingress ports

Access the external port of the Ingress pod by running:
`kubectl get service istio-ingressgateway -n istio-system -o wide`{{execute}}

You may now: 

1. Access the first port by running:
`kubectl get service istio-ingressgateway -n istio-system --template='{{(index .spec.ports 1).nodePort}}'`{{execute}}

This will print out the first port on your terminal. You may select a HTTP Port tab by clicking on (+), next to the `BookInfo` Server tab, and then entering your port number.

2. Obtain the complete URL by running:
`echo "http://$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[0].status.addresses[?\(@.type==\"InternalIP\"\)].address}):$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.spec.ports[1].nodePort}')/productpage"`{{execute}}

Sample Output: https://localhost/<port_number>

This will print out the complete URL for your pod. 
For this tutorial,  the `Bookinfo` Server tab is configured to be listening at host:`30381`: `http://localhost:31380`. This has been done because the Bookinfo application is **usually** deployed on the HTTP port: `31380`. If the port number printed in your terminal after running the above command is different from `31380`, please enter the `port number` in the `BookInfo` Server tab, before clicking on **Display Port**.

**Note**: To view the product page, you will have to append /productpage to the url.

