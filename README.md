# GravWave-AppleM2-Analysis

## Overview
The **Apple Silicon Gravitational-Wave Cluster** project focuses on harnessing the computational power of Apple Silicon M2 processors to build a high-performance cluster dedicated to gravitational-wave astronomy. Gravitational waves, predicted by Einstein's theory of general relativity, offer a unique window into the cosmos. This project aims to leverage the efficiency and capabilities of Apple Silicon to create a scalable and efficient computing environment for processing and analyzing gravitational-wave data.

### Key Objectives

- **Performance Optimization:** Utilizing Apple Silicon M2 processors to enhance computing speed and efficiency in gravitational-wave data analysis.

- **Cluster Scalability:** Building a scalable cluster architecture that can handle the complexities of processing large datasets inherent in gravitational-wave astronomy.

# PyCBC Project

## Environment Setup for Contributing

To contribute to PyCBC and work with the example `pycbc_inspiral` script, follow these steps to set up your development environment:

### 1. Fork the PyCBC Repository

Before proceeding, fork the PyCBC repository by following the instructions in the [CONTRIBUTING.md](https://github.com/gwastro/pycbc/blob/master/CONTRIBUTING.md#contributing-code) file.

#### Make a fork of PyCBC

- Go to the PyCBC repository [home page](https://github.com/gwastro/pycbc) <br>
- Click on the Fork button (top-right-hand corner) <br>
- Select the namespace that you want to create the fork in, this will usually be your personal namespace <br>

### 2. Clone Your Forked Repository

Clone your forked PyCBC repository onto your local machine. Open a terminal and navigate to the directory where you want to clone the repository:

```bash
git clone https://github.com/<git-username>/pycbc.git
cd pycbc
```

### 3. Activate Conda Environment

Activate your conda environment or create a new one. If you use an existing environment where PyCBC is already installed, consider uninstalling it from that environment.

```
conda activate your-environment

# If using an existing environment where PyCBC is already installed:
pip uninstall pycbc
```

### 4. Install Dependencies

Install the necessary dependent packages by running the following commands:

```
pip install -r requirements.txt
pip install -r companion.txt
```
### 5. Install PyCBC from Source

Install PyCBC from the source code in your cloned repository:

```
pip install .
```

### 6. Test pycbc_inspiral

Navigate to the examples/inspiral directory:

```
cd examples/inspiral
```

In this directory, there is a script called run.sh. Execute it:

```
bash run.sh
```

This setup completes the installation of PyCBC from the source code, and you can now test the pycbc_inspiral script as instructed.

# Installing lalsuite-extra

To obtain the necessary data files for your analysis, follow these steps:

## 1. Install lalsuite

```bash
conda install --channel conda-forge lalsuite
```
## 2. Clone the repository

```
git clone https://git.ligo.org/lscsoft/lalsuite.git
```

## 3. Get additional data files from lalsuite-extra

Navigate to the lalsuite directory:

```
cd lalsuite
```

Clone the lalsuite-extra repository:

```
git clone https://git.ligo.org/lscsoft/lalsuite-extra.git
```

Change directory to lalsuite-extra:

```
cd lalsuite-extra
```

Run the following commands to configure and install:

```
./00boot
./configure --prefix=${HOME}/<path_to_lalsuite-extra>
make install
```

Set the LAL_DATA_PATH environment variable:

```
echo 'export LAL_DATA_PATH=${HOME}/<path_to_lalsuite-extra>/share/lalsimulation' >> ~/.zshrc
```

or, if the above command is not effective:

```
echo 'export LAL_DATA_PATH=${HOME}/<path_to_lalsuite-extra>/share/lalsimulation' >> ~/.bashprofile
```

# HTCondor Installation Guide for MacOS

To utilize HTCondor as a user on MacOS, follow the steps below for a seamless installation:

### 1. Download HTCondor

Open a new terminal and download HTCondor:

```bash
cd
curl -fsSL https://get.htcondor.org | /bin/bash -s -- --download
```

### 2. Unpack and Rename

Unpack the downloaded tarball and rename the resulting directory:

```
tar -x -f condor.tar.gz
mv condor-*stripped condor
```

### 3. Navigate to the Condor Directory

Navigate to the condor directory, created in the previous step:

```
cd condor
```

### 4. Installation and Configuration

Execute the following command for installation and configuration:

```
./bin/make-personal-from-tarball
```

### 5. Activate HTCondor Environment

Whenever you want to use HTCondor, execute the following command:

```
. ~/condor/condor.sh
```

### 6. Start HTCondor

To start HTCondor, especially after a machine reboot:

```
condor_master
```

### 7. Verify Installation

You can verify the HTCondor installation by executing the following commands:

- `condor_status`: Displays the status and information about the computational
- `condor_q`: Displays information about the jobs submitted to the HTCondor system.

#### 8. Useful HTCondor Commands:

- `condor_q -nobatch`: To get job IDs
- `condor_q -analyze JOBID`: To analyze a job:
- `condor_release JOBID`: To remove a job from HOLD state
- `condor_rm JOBID`: To remove a job from IDLE state


# Setting up Pegasus and Resolving Installation Issues

## Installing Pegasus

After installing PyCBC, if you encounter any errors while executing Pegasus workflow, please consider doing the following steps to resolve issues

### a. Install Pycbc (If not done previously)

```bash
pip install .
```

#### Install homebrew before as mention here: [homebrew installation](https://docs.brew.sh/Installation) and follow the steps below

**Note:** To generate the executable workflow

### b. Tap into Pegasus-tools using

```
brew tap pegasus-isi/tools
```

### c. Install Pegasus

Now, install Pegasus using Homebrew:

```
brew install pegasus
```

These steps are essential to overcome any errors encountered during the installation process and to ensure a successful setup.






