

- Go to the Istio Management Page.
- Click the (▶️) icon on the Apply Custom Configuration card and paste the following manifest to create default destination rules for Bookinfo:

```
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: productpage
spec:
  host: productpage
  subsets:
    - name: v1
      labels:
        version: v1
---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: reviews
spec:
  host: reviews
  subsets:
    - name: v1
      labels:
        version: v1
    - name: v2
      labels:
        version: v2
    - name: v3
      labels:
        version: v3
---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: ratings
spec:
  host: ratings
  subsets:
    - name: v1
      labels:
        version: v1
    - name: v2
      labels:
        version: v2
    - name: v2-mysql
      labels:
        version: v2-mysql
    - name: v2-mysql-vm
      labels:
        version: v2-mysql-vm
---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: details
spec:
  host: details
  subsets:
    - name: v1
      labels:
        version: v1
    - name: v2
      labels:
        version: v2
---
```

- To verify your destination rules, Run :

`kubectl get destinationrules`{{execute}}
`kubectl get destinationrules -o yaml`{{execute}}

## Traffic Routing

#### V1

- We will first attempt to restrict traffic to only V1 amongst all the services.
- Click the (▶️) icon on the Apply Custom Configuration card and paste the following manifest :

```
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: reviews
spec:
  hosts:
    - reviews
  http:
    - route:
        - destination:
            host: reviews
            subset: v1
---
```
- To check up on your services, Run :
`kubectl get virtualservice`{{execute}}

**Reload the /productpage.You will only be able to view the data from v1 out of all the services, which means we will not see any ratings (any stars).**

#### V2

- We will now attempt to enable the ratings service for a particular user **Emily**, by routing productpage traffic to reviews V2.
- Click the (▶️) icon on the Apply Custom Configuration card and paste the following manifest :

```
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: reviews
spec:
  hosts:
  - reviews
  http:
  - match:
    - headers:
        end-user:
          exact: Emily
    route:
    - destination:
        host: reviews
        subset: v2
  - route:
    - destination:
        host: reviews
        subset: v1
---
```

**Now, we will login as the user **Emily**, post which we will be able to see data from reviews V2. While if you log in as a different user, you will only see data from reviews v1.**