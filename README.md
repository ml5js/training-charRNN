# Training a charRNN and using the model in ml5js

Multi-layer Recurrent Neural Networks (LSTM, RNN) for character-level language models in Python using Tensorflow and modified to work with [tensorflow.js](https://js.tensorflow.org/) and [ml5js](https://ml5js.org/)

Based on [char-rnn-tensorflow](https://github.com/sherjilozair/char-rnn-tensorflow).

## Requirements

- Set up a python environment with tensorflow installed. This repo is compatible with `python 3.6.x` and `tensorflow 1.x` only! This [video tutorial about Python virtualenv](https://youtu.be/nnhjvHYRsmM) may help.

## Usage

### Collect data

RNNs work well when you want predict sequences or patterns from your inputs. Try to gather as much input text data as you can. The more the better. Compile all of the text data into a single text file and make note of where the file is stored (path) on your computer.

_(A quick tip to concatenate many small disparate `.txt` files into one large training file: `ls *.txt | xargs -L 1 cat >> input.txt`)_

### Set-up Python Environment

This first step of using a python "virtual environment" ([venv video tutorial](https://youtu.be/nnhjvHYRsmM)) is recommended but not required.

```bash
$ python3 -m venv your_venv_name
$ source your_venv_name/bin/activate
```

### Train model

Note you can also [download this repo](https://github.com/ml5js/training-charRNN) as an alternative to `git clone`.

```bash
$ git clone https://github.com/ml5js/training-charRNN
$ cd training-charRNN
$ pip install -r requirements.txt
$ python train.py --data_path /path/to/data/file.txt

```

Optionally, you can specify the hyperparameters you want depending on the training set, size of your data, etc:

```bash
python train.py --data_path ./data \
--rnn_size 128 \
--num_layers 2 \
--seq_length 50 \
--batch_size 50 \
--num_epochs 50 \
--save_checkpoints ./checkpoints \
--save_model ./models
```

When training is complete a JavaScript version of your model will be available **in a folder called `./models`** (unless you specify a different path.)

Once the model is ready, you'll just need to point to it in your ml5 sketch, for more visit the [charRNN() documentation](https://learn.ml5js.org/#/reference/charrnn).

```javascript
const charRNN = new ml5.charRNN('./models/your_new_model');
```

That's it!

## Hyperparameters

Given the size of the training dataset, here are some hyperparameters that might work:

- 2 MB:
  - rnn_size 256 (or 128)
  - num_layers 2
  - seq_length 64
  - batch_size 32
  - output_keep_prob 0.75
- 5-8 MB:
  - rnn_size 512
  - num_layers 2 (or 3)
  - seq_length 128
  - batch_size 64
  - dropout 0.25
- 10-20 MB:
  - rnn_size 1024
  - num_layers 2 (or 3)
  - seq_length 128 (or 256)
  - batch_size 128
  - output_keep_prob 0.75
- 25+ MB:
  - rnn_size 2048
  - num_layers 2 (or 3)
  - seq_length 256 (or 128)
  - batch_size 128
  - output_keep_prob 0.75

Note: output_keep_prob 0.75 is equivalent to dropout probability of 0.25.

## Additional resources

- [Blog post describing how to train and use an LSTM network in ml5.js](https://blog.paperspace.com/training-an-lstm-and-using-the-model-in-ml5-js/)
- [Video showing how to train an LSTM network using Spell and ml5.js](https://youtu.be/xfuVcfwtEyw) to generate text in the style of a particular author.

