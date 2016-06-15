#!/bin/bash

#######
#Set up environment
#######
set +e
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc530
env

#######
#Set up CMSSW
#######
cd $GC_SCRATCH #this is the TMPDIR assigned by grid-control, lives in the right place on /scratch, auto-cleaned
scramv1 project CMSSW CMSSW_8_0_5
cd CMSSW_8_0_5/
eval `scramv1 runtime -sh`
cd $GC_SCRATCH

#######
#Now run our code
#######
echo "dataset:", $DATASETPATH >> out.txt
echo "files:", $FILE_NAMES >> out.txt
echo "cmdline arguments", $@ >> out.txt
python script.py $DATASETPATH $FILE_NAMES

#######
#Make output directory in case it doesn't exist
#######
OUTDIR=gsiftp://t3se01.psi.ch/pnfs/psi.ch/cms/trivcat/store/user/$USER/Example_PSI/$GC_TASK_ID/$DATASETPATH/
env -i X509_USER_PROXY=~/.x509up_u`id -u` gfal-ls $OUTDIR
if [ $? -eq 0 ]; then
    echo "exists", $OUTDIR 
else
    env -i X509_USER_PROXY=~/.x509up_u`id -u` gfal-mkdir -p $OUTDIR
fi

#######
#copy files to output directory
#######
env -i X509_USER_PROXY=~/.x509up_u`id -u` gfal-copy file://$GC_SCRATCH/out.txt $OUTDIR/out_$GC_JOB_ID.txt
env -i X509_USER_PROXY=~/.x509up_u`id -u` gfal-copy file://$GC_SCRATCH/out.root $OUTDIR/out_$GC_JOB_ID.root
