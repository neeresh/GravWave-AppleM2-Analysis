# Running Inspiral Using HTCondor

This directory contains resources and instructions for running the Inspiral task using HTCondor.

## File Purposes

In this directory, you'll find the following files, each serving a specific purpose:

- **`condor_run.sh`**: This file contains a modified inspiral code used for conducting the inspiral analysis.

- **`condor_GW150914.submit`**: This file specifies a Condor job configuration for the execution of the `condor_run.sh` script with given arguments, transfers required input files, defines output and error file paths, sets resource requests for CPU, memory, and disk usage, and includes a queue statement to submit the job for execution.

- **`condor_GW150914.dag`**: This file defines two Condor jobs (job1 and job2) based on the condor_GW150914.submit job configuration. Each job is associated with specific values for `gps_start_time` and `gps_duration` i.e., `(gps_end_time = gps_start_time + gps_duration)`, namely "1126259078" and "256" for job1, and "1126259078" and "512" for job2.

## Preparations Before Executing HTCondor Inspiral

- **`condor_run.sh`**: Replace the placeholders **`<path_to_wget>`**, **`<path_to_pycbc_condition_strain>`**, **`<path_to_pycbc_inspiral>`** with the actual paths by using the which command to locate the executables (e.g., which wget, etc.).

- **`condor_GW150914.submit`**: Replace the placeholder **`<path_to_lalsuite-extra_cloned_directory>`** with the appropriate path where the lalsuite-extra was cloned.

## Conducting inspiral analysis

Execute the following command to initiate the inspiral analysis using HTCondor.

```
condor_submit_dag condor_GW150914.dag
```

Execute the following command to delete all generated files:

```
bash clean.sh
```
