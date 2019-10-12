# hpcreport

## Data

See [docs](docs/data.md)

## Setup

### 1. Checkout copy of this repo

```
$ mkdir -p $HOME/projects
git clone git@github.com:usf-hii/hpcreport $HOME/projects/hpcreport
cd $HOME/projects/hpcreport
```

### 2. Install miniconda3

Note: If you do not yet have it installed, download miniconda3 at https://conda.io/miniconda.html
using the following instructions (requires Linux 64-bit platform):

From your shell type:

    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda3-latest.sh

From your shell type:

    bash $HOME/miniconda3-latest.sh

Ensure either your or the installer adds the following line to your `~/.bashrc`:

    export PATH=$HOME/miniconda3/bin:$PATH

From your shell type:

    source ~/.bashrc

Ensure your copy of conda is up to date:

    conda update --yes conda

### 3. Create an hpcreport conda environment

Create a project-specific conda environment using the `conda-env.yaml` file:

    conda env create -f conda-env.yaml

By default your environment will be created at `$HOME/miniconda3/envs/hpcreport`

### 4. Activate the environment

    source activate hpcreport

Your shell prompt should now be prefixed with the name of the currently activated environment:

    (hpcreport)$

## Reports

    source activate hpcreport

    FILESYSTEM=/home \
      jupyter nbconvert --execute --ExecutePreprocessor.timeout=1200 \
        --to html --output tmp/$(date +%Y-%m)-${report} ${report}.ipynb

    FILESYSTEM=/home \
      jupyter nbconvert --execute --ExecutePreprocessor.timeout=1200 \
        --to html --output tmp/$(date +%Y-%m)-${report} ${report}.ipynb

## Sync to depot for archiving

    for report in compute find-shares find-hii-work find-home; do
      rsync tmp/$(date +%Y-%m)-${report}.html rhino.epi.usf.edu:/depot/src/countskm/hpcreport/reports/
    done

