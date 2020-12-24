For the purpose of this tutorial session, we will be deploying the Bookinfo sample app with Istio and the Emojivoto sample app with Linkerd.

# Istio

## Deploy the Istio Bookinfo Sample App

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

You should now be able to see the BookInfo dashboard on the screen.

# Linkerd

## Deply the Linkerd EMojivoto Sample App

1. Verify the status of your proxy injector by running:
`kubectl get deployment linkerd-proxy-injector -n linkerd-system`{{execute}}
2. Navigate to the Linkerd Management page on the Meshery dashboard.
3. Select `Emojivoto Application` from the list of available **Sample Applications**.
4. Verify succesfful deployment:
`watch kubectl get deployment -n default`{{execute}} 
5. Verify that all the deployments are **READY** before continuing.
`watch kubectl get po -n default`{{execute}} 
6. You may view the sidecar configurations of any of Emojivoto's services:
`kubectl get svc -n default`{{execute}}
`kubectl describe svc/web-svc -n default`{{execute}}
7. Assess the application deployment by port-forwarding the web-svc service:
`kubectl port-forward svc/web-svc 80:80 --address 0.0.0.0 -n default`{{Execute}}
8. Click on <i class="fa fa-plus" aria-hidden="true"></i> icon, next to the `Meshery Server` tab
9. Enter the port number: **80** before clicking on **Display Port**.

You should now be able to access the Emojivoto dashboard.

