#!/bin/bash

# This are the hyperparameters you can change to fit your data
python train.py --data_path=./data \
--rnn_size 128 \
--num_layers 2 \
--seq_length 50 \
--batch_size 50 \
--num_epochs 50 \
--save_checkpoints ./checkpoints \
--save_model ./models