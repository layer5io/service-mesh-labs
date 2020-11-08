
[Meshery](https://meshery.io/) is written in Golang and leverages Go modules. The UI is built using React and Next.JS.
Your katacoda environment is already configured with stable versions of Golang, npm and node, which is all you need to run Meshery!

- **Jump into the Meshery repository with:**

`cd meshery`{{execute}}

- **Install the UI dependencies:**

`make setup-ui-libs`{{execute}}

The dependencies can take a few seconds to install. In the meanwhile, let's observe the Meshery architecture

![Meshery Architecture](./assets/meshery-architecture.png)

![Meshery Object Model](./assets/meshery-object-model.png)

- **Build and export the UI:**

`make build-ui`{{execute}}

While Meshery whips up its tailor-made UI for you, get an overview of it's features:

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vSJdaOJ6MdmYQCyd2c3sbGsa9h7BVqauzBpdeVIKMpAh4eHoStLTMS8hmYJdzT0YTgXzS2chyrLPRzR/embed?start=true&loop=true&delayms=5000" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>



