The components deployed on the service mesh by default are not exposed outside the cluster. An Ingress Gateway is deployed as a Kubernetes service of type LoadBalancer (or NodePort). To make Bookinfo accessible external to the cluster, you have to create an `Istio Gateway` for the Bookinfo application and also define an `Istio VirtualService` with the routes we need.

## Set up the Ingress pod

Expose the Ingress gateway with:
`kubectl get svc istio-ingressgateway -n istio-system -o yaml`{{execute}}

Get the name of the Istio-ingressgateway:
`kubectl get pods -n istio-system`{{execute}}

Swap the placeholder with the name of your Istio-ingressgateway and run:
`kubectl -n istio-system exec -it <istio-ingressgateway-...> bash`{{execute}}

Exit out of the container, back to host with:
`exit`{{execute}}

## Apply default destination rules

We need to define the available versions of the deployed services, called subsets, in destination rules before running Bookinfo. This creates destination rules for each of the BookInfo services and defines version subsets:
Using Meshery, navigate to the `Istio management` page:

- Enter `default` in the Namespace field.
- Click the (+) icon on the Configure card and select `Default BookInfo destination rules (defines subsets)` from the list.

Verify the destination rules with:
`kubectl get destinationrules`{{execute}}

`kubectl get destinationrules -o yaml`{{execute}}


## Access the Ingress ports

Access the external port of the Ingress pod by running:
`kubectl get service istio-ingressgateway -n istio-system -o wide`{{execute}}

You may now: 

1. Access the first port by running:
`kubectl get service istio-ingressgateway -n istio-system --template='{{(index .spec.ports 1).nodePort}}'`{{execute}}

2. Obtain the complete URL by running:
`echo "http://$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[0].status.addresses[?\(@.type==\"InternalIP\"\)].address}):$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.spec.ports[1].nodePort}')/productpage"`{{execute}}

The Bookinfo application should now be deployed on the HTTP port: `31380`. Make your way to the `Istio-Bookinfo` Server tab. For this tutorial, the server is configured to be listening at `http://localhost:31380`

