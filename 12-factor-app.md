# 12 Factor App 

## What Do I think a 12 factor app is?

I think that a 12 factor app is a methodology for building software as a service. This includes factors like scalability, authentication. I dont know 12 factors of this methodology but I am about to learn.




## 12 Factors

```
1. Codebase
```

One codebase tracked in revision control, many deploys

```
2. Dependencies
```

Explicitly declare and isolate dependencies

The python example is pip for package dependencies and virtual env for an isolation environment. We are using npm and docker respectively for our depenency and environment set up.


```
3. Config
```

Store config in the environment

The twelve-factor app stores config in environment variables. 

```
4. Backing services
```

Treat backing services as attached resources

A backing service is any service the app consumes over the network as part of its normal operation. The code for a twelve-factor app makes no distinction between local and third party services.

A deploy of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party (such as Amazon RDS) without any changes to the app’s code.


```
5. Build, release, run
```

Strictly separate build and run stages

The twelve-factor app uses strict separation between the build, release, and run stages

The build stage is a transform which converts a code repo into an executable bundle known as a build. Using a version of the code at a commit specified by the deployment process, the build stage fetches vendors dependencies and compiles binaries and assets.

The release stage takes the build produced by the build stage and combines it with the deploy’s current config. The resulting release contains both the build and the config and is ready for immediate execution in the execution environment.

The run stage (also known as “runtime”) runs the app in the execution environment, by launching some set of the app’s processes against a selected release.



```
6. Processes
```

Execute the app as one or more stateless processes

Twelve-factor processes are stateless and share-nothing



```
7. Port binding
```

Export services via port binding

The twelve-factor app is completely self-contained. The web app exports HTTP as a service by binding to a port, and listening to requests coming in on that port.


```
8. Concurrency
```

Scale out via the process model

In the twelve-factor app, processes are a first class citizen.

Instead, rely on the operating system’s process manager (such as systemd, a distributed process manager on a cloud platform, or a tool like Foreman in development) to manage output streams, respond to crashed processes, and handle user-initiated restarts and shutdowns.


```
9. Disposability
```

Maximize robustness with fast startup and graceful shutdown

Processes shut down gracefully when they receive a SIGTERM
Processes should also be robust against sudden death


```
10. Dev/prod parity
```

Keep development, staging, and production as similar as possible

The twelve-factor developer resists the urge to use different backing services between development and production,

But all deploys of the app (developer environments, staging, production) should be using the same type and version of each of the backing services.


|                                |                  |                        |  
|--------------------------------|------------------|------------------------|
|                                | Traditional App  | 12 Factor App          |
| Time Between Deploys           | Weeks            | Hours                  |
| Code authors vs code deployers | Different people | Same people            |
| Dev vs production environments | Divergent        | As similar as possible |
|                                |                  |                        |


```
11. Logs
```

Treat logs as event streams

A twelve-factor app never concerns itself with routing or storage of its output stream


```
12. Admin processes
```

In a local deploy, developers invoke one-off admin processes by a direct shell command inside the app’s checkout directory. In a production deploy, developers can use ssh or other remote command execution mechanism provided by that deploy’s execution environment to run such a process.



## Reflection

The 12 factor App is a set of "advisory" guidelines for building scalable, robust web applications. From Adam's experience building Heroku, he offers this wisdom to apply to cloud based web applications. From using Heroku, you can see many of these factors utilised. From logs, to crash only software (Disposibility). I like and am familiar with many of these concepts. I really like the idea of continuous deployment, deploying code every couple of hours. 

This reading and research was a very top level read. I think these concepts should be explored again in the near future to really absorb what I have read.