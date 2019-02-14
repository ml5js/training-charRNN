# Training a LSTM network and using the model in ml5js, on Windows

## Presentation

This is a fork of the original [Train LSTM in ml5js](https://github.com/ml5js/training-lstm) repo, with few updates to make it work correctly on Windows.

## Requirement

### Clone the repo

- Clone or download this repo on your computer.

### Set up a python environnement with Anaconda

At the moment, Tensorflow requires the `3.6.5` version of python, it won't install if your current installed version is `3.7` for example. So we install Anaconda in order to manage the different python version.

- Download and install the lastest .exe version of [Anaconda for Windows](https://www.anaconda.com/distribution/).
- **At the root of the Anaconda3 installation folder, rename the `Lib` folder to `lib`**. Thanks to this [we will avoid an upcoming error](https://github.com/tensorflow/tensorflow/issues/23368#issuecomment-443516709).
- Move to the `training-lstm` directory on your disk.
- From the newly installed Anaconda command prompt, create a new environnement named `tensorflow_env`, activate it, install the good version of python, then install tensorflow.

```
conda create -n tensorflow_env
conda activate tensorflow_env
conda install python=3.6.5
pip install tensorflow
```

## Usage 

0. Add a `input.txt` file in the data directory as the root of the project. **The file has to be encoded in UTF-8**.
1. Inside the Anaconda command prompt, run `conda activate tensorflow_env`
 
    > `tensorflow_env` refers to the environnement previously created with Anaconda.
 
2. `python train.py`
