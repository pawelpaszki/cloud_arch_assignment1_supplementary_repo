#! /bin/sh
export INSTANCE_ID=$(curl --silent http://169.254.169.254/latest/meta-data/instance-id/)
sudo -u ec2-user mkdir -p /home/ec2-user/.aws
sudo -u ec2-user echo "[default]
output = json
region = us-east-1" >> /home/ec2-user/.aws/config
sudo -u ec2-user echo "[default]
aws_access_key_id = <key_id>
aws_secret_access_key = <secret_access_key>
aws_session_token = <session_token>" >> /home/ec2-user/.aws/credentials
chown ec2-user.ec2-user /home/ec2-user/.aws/credentials
chown ec2-user.ec2-user /home/ec2-user/.aws/config
sudo -u ec2-user aws configure set aws_access_key_id <key_id>
sudo -u ec2-user aws configure set aws_secret_access_key <session_token>
sudo -u ec2-user aws configure set aws_session_token <session_token>
sudo -u ec2-user crontab<<EOF
*/1 * * * * /home/ec2-user/react-metrics.sh
EOF
docker run -d -p 80:3000 -e REACT_APP_NODE_APP_URL="http://<node-internal-ip>:8000" -e REACT_APP_INSTANCE_ID=$INSTANCE_ID pawelpaszki/react-sample
