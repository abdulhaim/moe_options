#!/bin/bash
FOLDER_NAME="option-critic-pytorch-moe"

SSH_ADDRESS="ec2-52-23-201-48.compute-1.amazonaws.com"
SUBFOLDER_NAME="exp1"
mkdir ~/Documents/IAP/Research/$FOLDER_NAME/logs/$SUBFOLDER_NAME
scp -i ~/Documents/research/aws/marwa_key_pair.pem -r ubuntu@$SSH_ADDRESS:/home/ubuntu/$FOLDER_NAME/logs/* ~/Documents/IAP/Research/$FOLDER_NAME/logs/$SUBFOLDER_NAME/
