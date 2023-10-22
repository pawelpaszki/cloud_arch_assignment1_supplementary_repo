#! /bin/sh
yum update -y
yum install -y git
yum install -y httpd
systemctl enable httpd
systemctl start httpd
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on
sudo -u ec2-user curl -o /home/ec2-user/react-metrics.sh https://raw.githubusercontent.com/pawelpaszki/cloud_arch_metrics/main/react-metrics.sh
sudo -u ec2-user chmod +x /home/ec2-user/react-metrics.sh
sudo -u ec2-user docker pull pawelpaszki/react-sample
