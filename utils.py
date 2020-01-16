import gym
import numpy as np
import torch

from gym.wrappers import AtariPreprocessing, TransformReward
from gym.wrappers import FrameStack as FrameStack_

from fourrooms import Fourrooms

def make_env(env_name):

    if env_name == 'fourrooms':
        return Fourrooms()

def to_tensor(obs):
    obs = np.asarray(obs)
    obs = torch.from_numpy(obs).float()
    return obs
