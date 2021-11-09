
This repository contains submit file and shell scripts to start Apache Spark in standalone mode on HTCondor, specific to LIneA environment.

## Prerequisites
* HTCondor (vanilla universe)
* Spark 2.40
* Network access between the cluster nodes
* Python 3

## Preperation
Assuming that Spark is properly installed and that the server where the repository is located is a HTCondor commit node, run the ```./spark.master.sh``` script to start the master.

The script generates two .url files containing the master url and webui url

The ```spark-master.url``` file will be used to link the master with the workers and it will also be important to keep the jobs stuck in HTCondor. By removing this file, the connection with the workers will be lost and HTCondor jobs will be released.

## Running Spark in Standalone
To start workers, edit the ```spark.workers.sh``` and replace the path to the environment variables at the top of the file and run ```condor_submit spark.workers -queue [num_workers] ```

The default worker size is 56 CPUs and 120G RAM.

Note: The master runs on the first worker node

## Accessing the Cluster

You may submit a job using (bash syntax) e.g. ```spark-submit --master $(<spark-master.url) helloworld.py```

## Stopping the Cluster
To stop the jobs either call ```./spark.stop.sh``` or manually delete spark-master.url

## Links
* http://research.cs.wisc.edu/htcondor/manual/current/condor_submit.html
* https://spark.apache.org/docs/latest/spark-standalone.html

## Other solutions
* https://github.com/rlmv/spark-condor/

### This repository was inspired by this solution
* https://github.com/SmartDataInnovationLab/spark.condor 

