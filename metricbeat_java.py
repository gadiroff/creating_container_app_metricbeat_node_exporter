#!/usr/bin/python


import os
cmd01 = 'java -jar /java/rp/route-planner-impl/target/route-planner-impl.jar &'
cmd02 = './node_exporter &'
cmd03 = 'metricbeat -e'
os.system(cmd01)
os.system(cmd02)
os.system(cmd03)
