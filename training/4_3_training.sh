#!/bin/bash

set -e # fail fast

# step 4iii: Training.

source "$(dirname ${0})/config.sh"

${JAVA_HOME_BIN}/java -classpath ${classpath} -Xms8000m -Xmx8000m \
  edu.cmu.cs.lti.ark.fn.parsing.TrainingBatchMain \
  model:${datadir}/argmodel.dat \
  alphabetfile:${training_dir}/scan/parser.conf.unlabeled \
  localfeaturescache:${training_dir}/scan/featurecache.jobj \
  train-framefile:${fe_file} \
  regularization:reg \
  lambda:0.1 \
  numthreads:${num_threads} \
  binaryoverlapfactor:false
