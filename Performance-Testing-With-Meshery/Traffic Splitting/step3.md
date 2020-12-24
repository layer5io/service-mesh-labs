In the product service page, you should now be able to see a list of reviews on the right. Those reviews are being loaded from the reviews service which is backed by the 3 reviews pods. The requests to the reviews service are randomly sent to one of the 3 review pods, as they represent different versions of this service.

The three different versions provide different output:

- v1 with No stars
- v2 with Orange stars
- v3 with Black stars

## Traffic Splitting with Linkerd

To split traffic between v1 and v2, we will apply a service yaml to introduce two new services. 
On the Meshery Dashboard, click the (▶️) icon on the Apply Custom Configuration card and paste the following manifest:

```
---
    
apiVersion: v1
kind: Service
metadata:
  name: reviews-v1
spec:
  selector:
    app: reviews
    version: v1
  ports:
  - protocol: TCP
    port: 9080
    targetPort: 9080

---

apiVersion: v1
kind: Service
metadata:
  name: reviews-v2
spec:
  selector:
    app: reviews
    version: v2
  ports:
  - protocol: TCP
    port: 9080
    targetPort: 9080
```

Check up on your newly deployed services. Run:
`kubectl get svc`{{execute}}
**You should now see `reviews-v1` and `reviews-v2` in the list.**

## Apply Traffic-Split CRD

To be able to split incoming requests across the reviews-v1 and reviews-v2 based on the weights provided, paste in the following manifest :

```
apiVersion: split.smi-spec.io/v1alpha1
kind: TrafficSplit
metadata:
  name: reviews-split
spec:
  service: reviews
  backends:
    - service: reviews-v1
      weight: 500m
    - service: reviews-v2
      weight: 500m
```

Go back to the product page, you should now be able to see the product reviews with orange or no stars appearing on each refresh, which signals a successful deployment.
