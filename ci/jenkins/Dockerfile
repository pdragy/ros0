FROM jenkins/jenkins
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
COPY config.xml $JENKINS_HOME/config.xml
COPY --chown=jenkins:jenkins jobs/ $JENKINS_HOME/jobs/
RUN find $JENKINS_HOME/jobs/* -exec cp $JENKINS_HOME/jobs/config.xml {} \;
# Follow system theme for light/dark
COPY theme.xml $JENKINS_HOME/io.jenkins.plugins.thememanager.ThemeManagerPageDecorator.xml
COPY libs.xml $JENKINS_HOME/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml
COPY pipeline_view.xml $JENKINS_HOME/io.jenkins.plugins.pipelinegraphview.PipelineGraphViewConfiguration.xml
COPY default-init.groovy /usr/share/jenkins/ref/init.groovy.d/
