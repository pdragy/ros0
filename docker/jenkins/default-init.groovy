#!groovy

import jenkins.model.JenkinsLocationConfiguration
import jenkins.model.Jenkins

def j = Jenkins.getInstance()

if (j.isUsageStatisticsCollected()) {
    j.setNoUsageStatistics(true)
    j.save()
}

// set  base url
jlc = JenkinsLocationConfiguration.get()
jlc.url = 'localhost:8080'
jlc.save()

