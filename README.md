Description
=====

Explanation of files
* `Example_PSI.conf`: main configuration for grid-control, how many jobs you want, what scripts you want to call. Many options, see `~jpata/grid-control/docs/documentation.conf` for more info
* `Example_PSI.sh`: script that will be called on the batch system
* `data*.dat`: custom data files, can contain multiple DATASETS, one `file = NEVENTS` per line, how you interpret the filename is up to you (see `script.py`)
* `script.py`: simple PyROOT script demonstrating the use of ROOT files from `/pnfs`

Usage
=====

How to run a job:
~~~
~jpata/grid-control/go.py Example_PSI.conf -c
...wait... (you can safely kill it with Ctrl-C at any time and resume later)
~~~

How to get a report after it's done:
~~~
~jpata/grid-control/scripts/report.py Example_PSI.conf -R LocationReport
~~~

The output is in

~~~
work.Example_PSI/output/job_0/:
gc.stderr #grid-control error messages
gc.stdout #grid-control stdout messages
job.info # some generic info
job.stderr.gz # YOUR JOB stderr, use less/zcat to view
job.stdout.gz # YOUR JOB stdout, use less/zcat to view
out.txt # small output files you asked to transfer with "output files"

work.Example_PSI/output/job_1/:
gc.stderr
gc.stdout
job.info
job.stderr.gz
job.stdout.gz
out.txt
~~~

and also copied to `/pnfs`

In case you want to clean up and start again, just delete `work.Example_PSI`.
