Basic UI build and run

```
docker build -t ros0 .
docker run --rm -it -p 8080:8080 ros0
```
and visit localhost:8080 in a browser.

To run a build with docker, you'll need to pass through the docker daemon:


The job config and main jenkins config are intended to be read-only. 

To run, with persistent job build history:
```
TODO
```


Pipelines are stored in ros0-pipelines repo. To change this, edit jobs/config.xml.
