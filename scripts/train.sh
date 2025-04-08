#!/bin/bash
# custom config
TRAINER=NNIFSOD

DATA=$1
DATASET=$2
CFG=$3  # config file
CTP=$4  # class token position (end or middle)
NCTX=$5  # number of context tokens
SHOTS=$6  # number of shots (16)


CSC=Trure
xi=0.7

for SEED in 1 2 3
do
    DIR=output/${DATASET}/${TRAINER}/${CFG}_${SHOTS}shots/nctx${NCTX}_csc${CSC}_ctp${CTP}/seed${SEED}
    if [ -d "$DIR" ]; then
        echo "Oops! The results exist at ${DIR} (so skip this job)"
    else
        echo $PWD
        python train.py \
        --root ${DATA} \
        --seed ${SEED} \
        --trainer ${TRAINER} \
        --dataset-config-file configs/datasets/${DATASET}.yaml \
        --config-file configs/trainers/NNIFSOD/${CFG}.yaml \
        --output-dir ${DIR} \
        --lambda_value ${lambda} \
        --topk ${topk} \
        TRAINER.NNIFSOD.N_CTX ${NCTX} \
        TRAINER.NNIFSOD.CSC ${CSC} \
        TRAINER.NNIFSOD.CLASS_TOKEN_POSITION ${CTP} \
        DATASET.NUM_SHOTS ${SHOTS}
    fi
done
