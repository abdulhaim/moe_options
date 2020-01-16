# Sparsely-Gated Mixture-of-Experts Layers.
# See "Outrageously Large Neural Networks"
# https://arxiv.org/abs/1701.06538
#
# Author: David Rau
#

from moe import MoE
import torch
from torch import nn
from torch.optim import Adam


def train(x,y, model, loss_fn, optim):
    # model returns the prediction and the loss that encourages all experts to have equal importance and load
    y_hat, aux_loss = model(x.float())
    # calculate prediction loss
    loss = loss_fn(y_hat, y)
    # combine losses
    total_loss = loss + aux_loss
    optim.zero_grad()
    total_loss.backward()
    optim.step()
    
    print("Training Results - loss: {:.2f}, aux_loss: {:.3f}".format(loss.item(), aux_loss.item()))
    return model

def input_data(batch_size, options_W, option,num_classes):

    # what is the input? 
    # what is the output? 

    # knowns: the experts are arbitrary, but you still need to have input of some sort? observation space?
    #         the gate is the intra option policy 
    #         the output is the new intra option policy????? This is confusing 

    x = nn.Sequential(
        nn.Linear(, 32),
        nn.ReLU(),
        nn.Linear(32, 64),
        nn.ReLU()
    )

    y = self.options_W[option]
    return x,y 


def update_intra_option(options_W):

    # arguments
    input_size = 1000
    num_classes = 20 # 
    num_experts = 10 # additional parameter as each expert is now arbitrarily defined, is just a neural network 
    hidden_size = 64 
    batch_size = 5

    k = 4

    # instantiate the MoE layer
    model = MoE(input_size, num_classes, num_experts, hidden_size, k=k, noisy_gating=True)

    loss_fn = nn.NLLLoss()
    optim = Adam(model.parameters())

    x, y = input_data(batch_size, input_size, num_classes)

    # train
    model = train(x, y, model, loss_fn, optim)
    # # evaluate
    # x, y = dummy_data(batch_size, input_size, num_classes)
    # eval(x, y, model, loss_fn)
