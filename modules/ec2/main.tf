resource "aws_security_group" "ec2-sg" {
  name        = "${var.instance_name}-security-group"
  description = "security group for ec2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3100
    to_port     = 3100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-server-key"
  public_key = file("${path.root}/.ssh/key.pub")
}

resource "aws_instance" "my-server" {
  key_name               = aws_key_pair.my-key.key_name
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]

  user_data = <<-EOF
#!/bin/bash

exec > /var/log/user-data.log 2>&1

apt update -y
apt install docker.io -y
systemctl start docker
systemctl enable docker
systemctl restart docker

apt install docker-compose -y

mkdir -p /home/ubuntu/monitoring
cd /home/ubuntu/monitoring

cat <<EOT > docker-compose.yml
version: "3"

services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"

  loki:
    image: grafana/loki:2.9.0
    ports:
      - "3100:3100"

  node-exporter:
    image: prom/node-exporter
    ports:
      - "9100:9100"
EOT

cat <<EOT > prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node-exporter"
    static_configs:
      - targets: ["node-exporter:9100"]
EOT

cd /home/ubuntu/monitoring

sleep 20

docker-compose up -d

EOF

  tags = {
    Name = "Devops_Project_server"
  }
}
