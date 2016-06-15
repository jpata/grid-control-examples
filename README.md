

Usage
=====

How to run a job:
~~~
~jpata/grid-control/go.py Example_PSI.conf -c
...wait...
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

