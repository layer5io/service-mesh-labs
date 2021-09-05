![Imagehub on Consul](./assets/image-hub-on-consul-with-wasm-and-meshery.png)

You can now test your ability to "pull" an image (images are not in fact pulled, but an HTTP request is sent to the backend api). *You should not be able to pull an image.*

### Make your account

- Sign up as a new user and select a subscription plan
- Login with your new credentials
- Test your ability to "pull" an image (*You should be able to pull an image*)

Navigate to **Performance Management** 

### Performance Tests

- Configure a performance test against `http://x.x.x.x:31118/api/pull`{{copy}} (where x.x.x.x is your **machine's host IP address**, not "localhost")

- Enter { "authorization" : "<your user token>" }
- Run the performance test. Ensure that your subscription plan limit is enforced accordingly.
- Change your subscription plan and retest.

