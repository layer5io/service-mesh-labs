To set up and run a sample app on Consul, we will first need to set up an Ingress pathway.

Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. The components deployed on the service mesh by default are not exposed outside the cluster. An Ingress Gateway is deployed as a Kubernetes service of type LoadBalancer (or NodePort). To make any sample app accessible externally to the cluster, you have to create an `Consul Gateway` for the application and also define an `Consul VirtualService` with the routes we need.

## Set up the Ingress pod

Expose the Ingress gateway with:
`kubectl get svc consul-ingressgateway -n consul-system -o yaml`{{execute}}

Get the name of the Istio-ingressgateway:
`kubectl get pods -n consul-system`{{execute}}

Swap the placeholder with the name of your Istio-ingressgateway and run:
`kubectl -n consul-system exec -it <consul-ingressgateway-...> bash`{{execute}}

Exit out of the container, back to host with:
`exit`{{execute}}

## Access the Ingress ports

Access the external port of the Ingress pod by running:
`kubectl get service consul-ingressgateway -n istio-system -o wide`{{execute}}

You may now: 

1. Access the first port by running:
`kubectl get service consul-ingressgateway -n consul-system --template='{{(index .spec.ports 1).nodePort}}'`{{execute}}

2. Obtain the complete URL by running:
`echo "http://$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[0].status.addresses[?\(@.type==\"InternalIP\"\)].address}):$(kubectl get svc consul-ingressgateway -n consul-system -o jsonpath='{.spec.ports[1].nodePort}')/productpage"`{{execute}}

