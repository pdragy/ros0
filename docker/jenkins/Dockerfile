FROM jenkins/jenkins
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
COPY default-init.groovy /usr/share/jenkins/ref/init.groovy.d/
WORKDIR $JENKINS_HOME
COPY config.xml ./config.xml
COPY --chown=jenkins:jenkins ./plugin_xml/* .
COPY --chown=jenkins:jenkins jobs/ ./jobs/
RUN cat jobs/jobs.txt | xargs -I{} /bin/sh -c "mkdir jobs/{}; cp jobs/config.xml jobs/{}"
