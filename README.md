# 🚀 AWS DevOps Monitoring & Cost Optimization
### Terraform + Prometheus + Grafana

---

## 📌 Overview

A production-ready DevOps infrastructure built using **Terraform**, integrated with a complete monitoring and alerting system.

> 👉 Designed to **reduce AWS costs**, **automate infrastructure**, and provide **real-time observability**

---

## 🚀 Key Highlights

| Feature | Details |
|---|---|
| ✅ Infrastructure as Code | Terraform (modular structure) |
| ✅ Cost Optimization | 70–90% reduction |
| ✅ Real-time Monitoring | Prometheus + Grafana |
| ✅ Centralized Logging | Loki |
| ✅ Alerting | Integrated with Telegram |
| ✅ Automated Setup | via `user_data` |
| ✅ Monitoring Stack | Docker-based |

---

## 🧱 Architecture Diagram

![Architecture](images/architecture.png)

### 🔹 Architecture Flow

```
User → Internet → AWS EC2 (Terraform)
                        ↓
               Docker (Monitoring Stack)
                        ↓
Node Exporter → Prometheus → Grafana
                        ↓
                Alerts → Telegram
```

---

## ⚙️ Infrastructure (Terraform)

### 📁 Project Structure

```
.
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
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
```

### 🔹 Resources Provisioned

- VPC (`10.0.0.0/16`)
- Public Subnet
- Internet Gateway
- Route Table & Association
- EC2 Instance (`t2.micro`)
- Security Group (ports: `22`, `3000`, `9090`, `9100`, `3100`)
- IAM Role + Instance Profile

---

## 🐳 Monitoring Stack (Docker)

Deployed using **Docker Compose**:

| Service | Purpose |
|---|---|
| Prometheus | Metrics collection |
| Grafana | Visualization |
| Node Exporter | System metrics |
| Loki | Log aggregation |

### 📸 Running Containers

![Docker Containers](images/dockerContaimer.png)

---

## 📊 Grafana Dashboard

![Dashboard 1](images/grafana1.png)
![Dashboard 2](images/grafana2.png)
![Dashboard 3](images/grafana3.png)
![Dashboard 4](images/grafana4.png)
![Dashboard 5](images/grafana5.png)
![Dashboard 6](images/grafana6.png)

### 🔹 Metrics Covered

- 🔵 CPU Usage
- 🟢 Memory Usage
- 🟡 Disk Usage
- 🔴 Network Traffic

> 👉 Provides **real-time system visibility**

---

## 🔍 Prometheus Configuration

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "node-exporter"
    static_configs:
      - targets: ["node-exporter:9100"]
```

### 🔹 Explanation

- Scrapes metrics every **15 seconds**
- Collects system-level metrics
- Feeds data to **Grafana**

---

## 📜 Logging (Loki)

- Centralized logging system
- Integrated with Grafana
- Efficient log storage

> 👉 Useful for **debugging** and **monitoring logs**

---

## 🚨 Alerting System (Telegram)

![Alert 1](images/alert1.jpeg)
![Alert 2](images/alert2.jpeg)
![Alert 3](images/alert3.jpeg)
![Alert 4](images/alert4.jpeg)

### 🔹 Alerts Configured

| Alert | Threshold |
|---|---|
| CPU Usage | > 80% |
| Memory Usage | > 80% |
| Disk Usage | > 80% |

### 🔹 Alert Flow

```
Node Exporter → Prometheus → Grafana → Telegram
```

> 👉 Enables **proactive issue detection**

---

## 💰 Cost Optimization

| | Before | After |
|---|---|---|
| **Instance** | `t3.medium` | `t2.micro` |
| **Cost/month** | ~$60–70 | ~$0–10 |
| **Savings** | — | **70–90% reduction** 📉 |

---

## 🔐 Security Considerations

- ✅ IAM role used — no hardcoded credentials
- ✅ Sensitive files excluded via `.gitignore`
- ✅ SSH access restricted to specific IP
- ✅ Terraform state not exposed

---

## 🚀 Deployment Steps

```bash
# Clone repository
git clone https://github.com/adarshsingh7470/aws-devops-monitoring-terraform.git
cd aws-devops-monitoring-terraform/env/dev

# Initialize Terraform
terraform init

# Apply Infrastructure
terraform apply -auto-approve
```

---

## 🌐 Access Services

| Service | URL |
|---|---|
| Grafana | `http://<EC2-IP>:3000` |
| Prometheus | `http://<EC2-IP>:9090` |

---

## 💡 Use Case

This project can be used for:

- 🖥️ Monitoring production servers
- 💼 Startup infrastructure optimization
- 🛠️ Freelance DevOps services
- ☁️ Cloud infrastructure observability

---

## 🔮 Future Improvements

- [ ] CI/CD pipeline (GitHub Actions)
- [ ] Auto Scaling Group (ASG)
- [ ] Load Balancer (ALB)
- [ ] Kubernetes deployment

---

## 👨‍💻 Author

**Adarsh Singh**
📧 [adarshsinghrajawat75@gmail.com](mailto:adarshsinghrajawat75@gmail.com)
💼 DevOps Engineer | AWS | Terraform | Docker

---

## ⭐ Support

If you find this project useful, please give it a **⭐ on GitHub** 🚀

[![GitHub stars](https://img.shields.io/github/stars/adarshsingh7470/aws-devops-monitoring-terraform?style=social)](https://github.com/adarshsingh7470/aws-devops-monitoring-terraform)
