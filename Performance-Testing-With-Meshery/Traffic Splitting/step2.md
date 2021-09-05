
## Deploy a Sample Application

For the purpose of this tutorial, we will be deploying BookInfo with Istio and Linkerd :

## Istio :

1. Click on (+) under **Apply Service Mesh Configuration**
2. Choose **Automatic Sidecar Injection**
3. Check if istio-injection has been enabled for your namespace:
`kubectl get namespace -L istio-injection`{{execute}}
4. Select the `Bookinfo application` in the `Sample Application` drop down menu. This will install the Bookinfo sample app under the default namespace.
5. Verify that the deployments are all in a state of AVAILABLE before continuing.
  `watch kubectl get deployment`{{execute}}
6. Expose the Ingress gateway by running:
`kubectl get svc istio-ingressgateway -n istio-system -o yaml`{{execute}}
7. Click on (+), next to the `Meshery Server` tab. Choose *Open New Terminal* and run:
 `minikube tunnel`{{execute}}
8. Access the external port of the Ingress pod by running:
`kubectl get service istio-ingressgateway -n istio-system -o wide`{{execute}}
9. To print out the first port on your terminal, run:
`kubectl get service istio-ingressgateway -n istio-system --template='{{(index .spec.ports 1).nodePort}}'`{{execute}}
10. Click on <i class="fa fa-plus" aria-hidden="true"></i> icon, next to the `Meshery Server` tab
11. Enter the `port number` before clicking on **Display Port**.
12. To view the product page, append /productpage to the url of the page.

## Linkerd :

1. Select the `Bookinfo application` in the `Sample Application` drop down menu. This will install the Bookinfo sample app under the default namespace.
2. Verify that the deployments are all in a state of AVAILABLE before continuing.
  `kubectl get svc`{{execute}}
3. Check up on your connections :
    
    - `watch kubectl get deployment -n default`{{execute}} 
    - Verify that all the deployments are **READY** before continuing.
      `watch kubectl get po -n default`{{execute}} 
    - You may view the sidecar configurations of any of Emojivoto's services:
      `kubectl get svc -n default`{{execute}}
      `kubectl describe svc/productpage -n default`{{execute}}

4. Click on (+), next to the `Meshery Server` tab. Choose *Open New Terminal* and run:
 `minikube tunnel`{{execute}}
5. Return back to the first Terminal and Port Forward to the BookInfo dashboard. Run :
`kubectl port-forward svc/productpage 9080:9080 --address 0.0.0.0 -n default`{{execute}}
6. Click on <i class="fa fa-plus" aria-hidden="true"></i> icon, next to the `Meshery Server` tab
7. Enter the `port number`: **9080** before clicking on **Display Port**.
8. To view the product page, append /productpage to the url of the page.


You should now be able to see the BookInfo dashboard on the screen for both Linkerd and Istio.