🚀 AWS DevOps Monitoring & Cost Optimization (Terraform + Prometheus + Grafana)
📌 Overview

This project demonstrates a production-ready DevOps infrastructure built using Terraform and integrated with a complete monitoring and alerting system.

👉 Designed to reduce AWS costs, automate infrastructure, and provide real-time observability

🚀 Key Highlights
✅ Infrastructure as Code using Terraform (modular structure)
✅ Cost optimization (70–90% reduction)
✅ Real-time monitoring (Prometheus + Grafana)
✅ Centralized logging (Loki)
✅ Alerting system integrated with Telegram
✅ Fully automated setup using user_data
✅ Docker-based monitoring stack

🧱 Architecture Diagram

/images/architecture.png

🔹 Architecture Flow
User → Internet → AWS EC2 (Terraform)
       ↓
Docker (Monitoring Stack)
       ↓
Node Exporter → Prometheus → Grafana
       ↓
Alerts → Telegram
⚙️ Infrastructure (Terraform)
📁 Project Structure
.
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│
├── env/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── backend.tf
│
├── docker-compose.yml
├── prometheus.yml
├── images/
└── README.md


🔹 Resources Provisioned
VPC (10.0.0.0/16)
Public Subnet
Internet Gateway
Route Table & Association
EC2 Instance (t2.micro)
Security Group (22, 3000, 9090, 9100, 3100)
IAM Role + Instance Profile
🐳 Monitoring Stack (Docker)

Deployed using Docker Compose:

Prometheus → Metrics collection
Grafana → Visualization
Node Exporter → System metrics
Loki → Log aggregation
📸 Running Containers
screenshots
/images/dockerContaimer.png


📊 Grafana Dashboard
screenshots
/images/grafana1.png
/images/grafana2.png
/images/grafana3.png
/images/grafana4.png
/images/grafana5.png
/images/grafana6.png
🔹 Metrics Covered
CPU Usage
Memory Usage
Disk Usage
Network Traffic

👉 Provides real-time system visibility

🔍 Prometheus Configuration
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "node-exporter"
    static_configs:
      - targets: ["node-exporter:9100"]
🔹 Explanation
Scrapes metrics every 15 seconds
Collects system-level metrics
Feeds data to Grafana
📜 Logging (Loki)
Centralized logging system
Integrated with Grafana
Efficient log storage

👉 Useful for debugging and monitoring logs

🚨 Alerting System (Telegram)
screenshots
/images/alert1.jpeg
/images/alert2.jpeg
/images/alert3.jpeg
/images/alert4.jpeg

🔹 Alerts Configured
CPU usage > 80%
Memory usage > 80%
Disk usage > 80%
🔹 Alert Flow
Node Exporter → Prometheus → Grafana → Telegram

👉 Enables proactive issue detection

💰 Cost Optimization
🔻 Before
Instance: t3.medium
Cost: ~$60–70/month
🔺 After
Instance: t2.micro
Cost: ~$0–10/month
📉 Result

👉 70–90% cost reduction

🔐 Security Considerations
IAM role used (no hardcoded credentials)
Sensitive files excluded via .gitignore
SSH access should be restricted to specific IP
Terraform state not exposed
🚀 Deployment Steps
# Clone repository
git clone https://github.com/adarshsingh7470/aws-devops-monitoring-terraform.git
cd aws-devops-monitoring-terraform/env/dev

# Initialize Terraform
terraform init

# Apply Infrastructure
terraform apply -auto-approve
🌐 Access Services
Grafana → http://:3000
Prometheus → http://:9090
💡 Use Case

This project can be used for:

Monitoring production servers
Startup infrastructure optimization
Freelance DevOps services
Cloud infrastructure observability
🔮 Future Improvements
CI/CD pipeline (GitHub Actions)
Auto Scaling Group (ASG)
Load Balancer (ALB)
Kubernetes deployment
👨‍💻 Author

Adarsh Singh
📧 adarshsinghrajawat75@gmail.com
💼 DevOps Engineer | AWS | Terraform | Docker

⭐ Support

If you like this project, give it a ⭐ on GitHub 🚀