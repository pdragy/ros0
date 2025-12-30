# ros0 build farm

## Build

```
$ docker build -t ros0 .
```

## Run

To run the Jenkins UI only, run
```
$ docker run --rm -it -p 8080:8080 ros0
```
and visit [http://localhost:8080](http://localhost:8080) in a browser.

To allow jenkins to build a ROS package, enable it to use the host's docker.
```
$ docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):/usr/bin/docker \
    --group-add $(getent group docker | cut -d: -f3) \
    -p 8080:8080 \
    ros0
```

To run with persistent job build history, it may be useful to mount a volume from the host to $JENKINS_HOME/fingerprints:
```
$ mkdir fingerprints
$ docker run \
    -v ${PWD}/fingerprints:/var/jenkins_home/fingerprints \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):/usr/bin/docker \
    --group-add $(getent group docker | cut -d: -f3) \
    -p 8080:8080 \
    ros0
```

## Configure 

The job config and main jenkins config are intended to be read-only.

- Pipeline repo: `https://github.com/pdragy/ros0-pipelines`. This can be changed in `jobs/config.xml`.
- Shared library repo: `https://github.com/pdragy/ros0-library`. This can be changed in `plugin_xml/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml`
