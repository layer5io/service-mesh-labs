
**Get your own copy of the Meshery repository:**

`git clone https://github.com/layer5io/meshery.git`{{execute}}

**Read up while the repository gets cloned!**

Service meshes are a layer of cloud-centric architecture built right in as a layer of the application itself, rather than posing as an external attribute that needs to be managed and configured separately. They provide fine grained traffic control, inproved resiliency, observability and modernizes existing workloads without interfering with the existing deployment.

The service mesh architecture can be divided into three parts:

* **Data plane** - A collection of intelligent network proxies that bring together to intercept every request that goes through to your workloads.
* **Control Plane** - Interacts with your service mesh and dictates its behaviour
* **Management Plane** - Provides additional governance, expanded policy  and backend system integration

A perfect example of **Management Planes**, Meshery is **the service mesh management plane**. It mirrors the prominent features of SMPS and SMI and facilitates the benchmarking, interoperability, and standardization of service meshes, thus helping a user understand the overhead value of a service mesh and enabling them to fulfill their meshing needs efficiently.

As a management plane, Meshery lies above the Data plane, and the Control plane and boasts a list of features:

- Built-in load generators (WRK2, Fortio, and nighthawk)
- Improved efficiency with Docker containers
- Supporting 8 service meshes at the moment

We'll set up and run Meshery in the next step.
