
## Working with Linkerd

Using Meshery, select the Linkerd from the Management menu, and:

   -  Enter `ingress-nginx` into the namespace field.
   -  Click the (+) icon on the **Apply Service Mesh Configuration** card and select `NGINX Ingress Controller` to install the latest version of KIC.

## Set up Ingress controller

Nginx ingress will include the `l5d-dst-override header` to tell Linkerd where to direct the request. Using Meshery, click the (▶️) icon on the Apply Custom Configuration card and paste the following manifest:

  apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: web-ingress
  namespace: emojivoto
  annotations:
    kubernetes.io/ingress.class: "nginx"
    nginx.ingress.kubernetes.io/configuration-snippet: |
      proxy_set_header l5d-dst-override $service_name.$namespace.svc.cluster.local:$service_port;
      grpc_set_header l5d-dst-override $service_name.$namespace.svc.cluster.local:$service_port;

spec:
  rules:
    - host: example.com
      http:
        paths:
          - backend:
              serviceName: web-svc
              servicePort: 80
              
This will allow us to access the service without using a port-forward To test this:

   - Run this command to expose your Kubernetes's cluster services to your localhost network:

      `minikube tunnel`{{execute}}

   - Retrieve the external IP address by running:

       `kubectl get svc --all-namespaces \
          -l app=nginx-ingress,component=controller \
            -o=custom-columns=EXTERNAL-IP:.status.loadBalancer.ingress[0].ip`{{execute}}

   - You may now curl to your service without using port-forward, like this:

      `curl -H "Host: example.com" http://{external-ip}`{{execute}}

You can also access the Linkerd dashboard by port-forwarding from your local system to the linkerd-web service. Run:
`linkerd dashboard &`{{execute}}

Linkerd's control plane components has the Linkerd proxy sidecarred, which allows you to examine statistics of the traffic you are generating by looking at the dashboard. Execute:

`linkerd -n linkerd top deploy/linkerd-web`{{execute}}