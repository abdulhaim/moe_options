#!/bin/bash

FOLDER_NAME="option-critic-pytorch-moe"
declare -a arr=(
    "ec2-52-23-201-48.compute-1.amazonaws.com"
    "ec2-52-90-109-121.compute-1.amazonaws.com"
    "ec2-34-226-138-177.compute-1.amazonaws.com"
    "ec2-54-235-238-225.compute-1.amazonaws.com"
    "ec2-54-235-238-225.compute-1.amazonaws.com"
    )

for SSH_ADDRESS in "${arr[@]}"
do
    echo $SSH_ADDRESS

    # Pass folder that I want to train
    ssh -i ~/Documents/research/aws/marwa_key_pair.pem ec2-user@$SSH_ADDRESS "mkdir /home/ec2-user/$FOLDER_NAME"
    scp -i ~/Documents/research/aws/marwa_key_pair.pem ~/Documents/IAP/Research/$FOLDER_NAME/*.py ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/
    scp -i ~/Documents/research/aws/marwa_key_pair.pem ~/Documents/IAP/Research/$FOLDER_NAME//*.md ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/
    scp -i ~/Documents/research/aws/marwa_key_pair.pem ~/Documents/IAP/Research/$FOLDER_NAME/*.txt ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/
    scp -i ~/Documents/research/aws/marwa_key_pair.pem ~/Documents/IAP/Research/$FOLDER_NAME/*.sh ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/
    scp -i ~/Documents/research/aws/marwa_key_pair.pem ~/Documents/IAP/Research/$FOLDER_NAME/.gitignore ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/
    scp -i ~/Documents/research/aws/marwa_key_pair.pem -r ~/Documents/IAP/Research/$FOLDER_NAME/notebook ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/notebook
    scp -i ~/Documents/research/aws/marwa_key_pair.pem -r ~/Documents/IAP/Research/$FOLDER_NAME/.git ec2-user@$SSH_ADDRESS:/home/ec2-user/$FOLDER_NAME/.git

    # Pass dependency shell script
    scp -i ~/Documents/research/aws/marwa_key_pair.pem  -r /Documents/IAP/Research/$FOLDER_NAME/dependencies.sh ec2-user@$SSH_ADDRESS:/home/ec2-user/dependencies.sh
done
