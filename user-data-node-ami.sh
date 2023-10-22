#! /bin/sh
yum update -y
yum install -y git
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on
curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo -u ec2-user curl -o /home/ec2-user/node-metrics.sh https://raw.githubusercontent.com/pawelpaszki/cloud_arch_metrics/main/node-metrics.sh
sudo -u ec2-user chmod +x /home/ec2-user/node-metrics.sh
git clone https://github.com/pawelpaszki/sample_docker_node.git
cd sample_docker_node && docker-compose up -d
