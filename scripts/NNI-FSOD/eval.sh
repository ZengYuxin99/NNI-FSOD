#!/bin/bash

# custom config
TRAINER=NNI-FSOD

CSC=False
CTP=end

DATA=$1
DATASET=$2
CFG=$3

NCTX=16

T=$4
MODEL_dir=$5
Output_dir=$5

python eval_ood_detection.py \
--root ${DATA} \
--trainer ${TRAINER} \
--dataset-config-file configs/datasets/${DATASET}.yaml \
--config-file configs/trainers/NNI-FSOD/${CFG}.yaml \
--output-dir ${Output_dir} \
--model-dir ${MODEL_dir} \
--load-epoch 50 \
--T ${T} \
TRAINER.NNI-FSOD.N_CTX ${NCTX} \
TRAINER.NNI-FSOD.CSC ${CSC} \