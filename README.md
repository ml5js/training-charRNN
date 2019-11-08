# Training a charRNN and using the model in ml5js

Multi-layer Recurrent Neural Networks (LSTM, RNN) for character-level language models in Python using Tensorflow and modified to work with [tensorflow.js](https://js.tensorflow.org/) and [ml5js](https://ml5js.org/)

Based on [char-rnn-tensorflow](https://github.com/sherjilozair/char-rnn-tensorflow).

- **[Blog post describing how to train and use an LSTM network in ml5.js](https://blog.paperspace.com/training-an-lstm-and-using-the-model-in-ml5-js/)**.
- **[Video showing how to train an LSTM network using Spell and ml5.js](https://youtu.be/xfuVcfwtEyw)** to generate text in the style of a particular author.


## Requirements

- Set up a python environment with tensorflow installed. [More detailed instructions here](https://ml5js.org/docs/training-setup.html). You can also follow this [video tutorial about Python virtualenv](https://youtu.be/nnhjvHYRsmM).

## Usage

### 1) Download this repository

Start by [downloading](https://github.com/ml5js/training-charRNN) or cloning this repository:

```bash
git clone https://github.com/ml5js/training-charRNN.git
cd training-charRNN
```

### 2) Collect data

RNNs work well when you want predict sequences or patterns from your inputs. Try to gather as much input data as you can. The more the better.

Once your data is ready, create a text file (with any name) in the `root` (or any subdirectory) of this project. I'll assume it's called `input.txt` for the rest of this documentation.

_(A quick tip to concatenate many small disparate `.txt` files into one large training file: `ls *.txt | xargs -L 1 cat >> input.txt`)_

### 2) Train

Run the training script with the default settings:

```bash
python train.py --data_path=./folder_with_my_custom_data/input.txt
```

Or you can specify the hyperparameters you want depending on the training set, size of your data, etc:

```bash
python train.py --data_path=./folder_with_my_custom_data/input.txt --rnn_size 128 --num_layers 2 --seq_length 64 --batch_size 32 --num_epochs 1000 --save_model ./models --save_checkpoints ./checkpoints
```

This will train your model and save a JavaScript version **in a folder called `./models`**, if you don't specify a different path.

You can also run the script called `run.sh`:

```bash
bash run.sh
```

This file contains the same parameters as the one's described before:
```bash
# This are the hyperparameters you can change to fit your data
python train.py --data_path=./data \
--rnn_size 128 \
--num_layers 2 \
--seq_length 50 \
--batch_size 50 \
--num_epochs 50 \
--save_checkpoints ./checkpoints \
--save_model ./models
```

### 3) Use it!

Once the model is ready, you'll just need to point to it in your ml5 sketch:

```javascript
const charRNN = new ml5.charRNN('./models/your_new_model');
```

That's it!

## Hyperparameters

Given the size of the training dataset, here are some hyperparameters that might work:

* 2 MB: 
   - rnn_size 256 (or 128) 
   - num_layers 2 
   - seq_length 64 
   - batch_size 32 
   - output_keep_prob 0.75 
* 5-8 MB: 
  - rnn_size 512 
  - num_layers 2 (or 3) 
  - seq_length 128 
  - batch_size 64 
  - dropout 0.25
* 10-20 MB: 
  - rnn_size 1024 
  - num_layers 2 (or 3) 
  - seq_length 128 (or 256) 
  - batch_size 128 
  - output_keep_prob 0.75 
* 25+ MB: 
  - rnn_size 2048 
  - num_layers 2 (or 3) 
  - seq_length 256 (or 128) 
  - batch_size 128 
  - output_keep_prob 0.75
  
Note: output_keep_prob 0.75 is equivalent to dropout probability of 0.25.
