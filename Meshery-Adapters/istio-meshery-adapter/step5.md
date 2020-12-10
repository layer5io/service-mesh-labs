Your environment, including the Ingress gateway, will be configured automatically. This may take upto a minute.

While the set up is being performed :

1. Click on (+), next to the `Meshery Server` tab 
2. Choose *Open New Terminal*
3. Run:

 `minikube tunnel`{{execute}}

## Ingress ports

Access the external port of the Ingress pod by running:
`kubectl get service istio-ingressgateway -n istio-system -o wide`{{execute}}

You may now: 

1. Access the first port by running:
`kubectl get service istio-ingressgateway -n istio-system --template='{{(index .spec.ports 1).nodePort}}'`{{execute}}

This will print out the first port on your terminal. 

- Click on <i class="fa fa-plus" aria-hidden="true"></i> icon, next to the `Meshery Server` tab
- Enter the `port number` before clicking on **Display Port**.
- To view the product page, you will have to append /productpage to the url.

You should now be able to see the BookInfo dashboard on the screen

**Note**: 
You can also obtain the complete URL by running:
`echo "http://$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[0].status.addresses[?\(@.type==\"InternalIP\"\)].address}):$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.spec.ports[1].nodePort}')/productpage"`{{execute}}



