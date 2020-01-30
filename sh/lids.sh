#!/bin/bash

SSH_ADDRESS="acl-server.lids.mit.edu"
FOLDER_NAME="2018-hierarchical-teach"

# Pass folder that I want to train
ssh dkkim93@$SSH_ADDRESS "mkdir /home/dkkim93/$FOLDER_NAME"
scp /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/*.py dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/
scp /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/*.md dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/
scp /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/*.txt dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/
scp /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/*.sh dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/
scp /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/.gitignore dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/
scp -r /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/misc dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/misc
scp -r /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/policy dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/policy
scp -r /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/thirdparty dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/thirdparty
scp -r /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/trainer dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/trainer
scp -r /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/.git dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/.git
scp -r /home/dongki/research/lids/git/$FOLDER_NAME/$FOLDER_NAME/pytorch_models dkkim93@$SSH_ADDRESS:/home/dkkim93/$FOLDER_NAME/pytorch_models

# Pass dependency shell script
scp -i ~/research/aws/dongki.pem -r /home/dongki/research/aws/$FOLDER_NAME/dependencies.sh dkkim93@$SSH_ADDRESS:/home/dkkim93/dependencies.sh
