# 12 Factor App 

## What Do I think a 12 factor app is?

I think that a 12 factor app is a methodology for building software as a service. This includes factors like scalability, authentication. I dont know 12 factors of this methodology but I am about to learn.




## 12 Factors

```
1. Codebase

One codebase tracked in revision control, many deploys
```

```
2. Dependencies

Explicitly declare and isolate dependencies

The python example is pip for package dependencies and virtual env for an isolation environment. We are using npm and docker respectively for our depenency and environment set up.

```

```
3. Config

Store config in the environment

The twelve-factor app stores config in environment variables. 

```
```
4. Backing services

Treat backing services as attached resources

A backing service is any service the app consumes over the network as part of its normal operation. The code for a twelve-factor app makes no distinction between local and third party services.

A deploy of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party (such as Amazon RDS) without any changes to the app’s code.

```

```
5. Build, release, run

Strictly separate build and run stages

The twelve-factor app uses strict separation between the build, release, and run stages

The build stage is a transform which converts a code repo into an executable bundle known as a build. Using a version of the code at a commit specified by the deployment process, the build stage fetches vendors dependencies and compiles binaries and assets.

The release stage takes the build produced by the build stage and combines it with the deploy’s current config. The resulting release contains both the build and the config and is ready for immediate execution in the execution environment.

The run stage (also known as “runtime”) runs the app in the execution environment, by launching some set of the app’s processes against a selected release.


```

```
6. Processes

Execute the app as one or more stateless processes

Twelve-factor processes are stateless and share-nothing


```

```
7. Port binding


```

```
8. Concurrency


```

```
9. Disposability


```

```
10. Dev/prod parity


```

```
11. Logs


```

```
12. Admin processes


```