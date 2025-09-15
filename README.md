# Employee Check-in Web Application

A modern, serverless employee check-in system built with AWS S3, CloudFront CDN, and deployed using Terraform Infrastructure as Code.

## 🌟 Overview

This project provides a simple, scalable, and cost-effective solution for employee attendance tracking. The application is hosted as a static website on AWS S3 with global content delivery through CloudFront, ensuring fast loading times worldwide.

## 🏗️ Architecture

```
┌─────────────┐    ┌──────────────┐    ┌─────────────┐
│   Users     │───▶│  CloudFront  │───▶│     S3      │
│ (Employees) │    │     CDN      │    │   Bucket    │
└─────────────┘    └──────────────┘    └─────────────┘
                          │
                          ▼
                   ┌──────────────┐
                   │     SSL      │
                   │ Certificate  │
                   └──────────────┘
```

## ✨ Features

- **📱 Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **⚡ Fast Loading**: Global CDN ensures quick access from anywhere
- **🔒 Secure**: HTTPS encryption with SSL/TLS certificates
- **💰 Cost-Effective**: Serverless architecture with pay-per-use pricing
- **🚀 Scalable**: Automatically handles traffic spikes
- **📊 Real-time Check-in**: Instant attendance recording
- **🔧 Easy Maintenance**: Infrastructure as Code with Terraform

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Cloud Infrastructure**: AWS S3, AWS CloudFront
- **Infrastructure as Code**: Terraform
- **SSL/TLS**: AWS Certificate Manager
- **Domain Management**: AWS Route 53 (optional)

## 📋 Prerequisites

Before deploying this application, ensure you have:

- AWS Account with appropriate permissions
- [Terraform](https://www.terraform.io/downloads.html) installed (v1.0+)
- [AWS CLI](https://aws.amazon.com/cli/) configured
- Git for version control

### Required AWS Permissions

Your AWS user/role should have permissions for:
- S3 (CreateBucket, PutObject, PutBucketPolicy, etc.)
- CloudFront (CreateDistribution, UpdateDistribution, etc.)
- Certificate Manager (if using custom domain)
- Route 53 (if using custom domain)

## 🚀 Deployment

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/employee-checkin-webapp.git
cd employee-checkin-webapp
```

### 2. Configure Terraform Variables

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your specific values:

```hcl
# terraform.tfvars
aws_region = "us-east-1"
project_name = "employee-checkin"
environment = "prod"
domain_name = "checkin.yourcompany.com"  # optional
```

### 3. Initialize and Deploy Infrastructure

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the changes
terraform apply
```

### 4. Upload Website Files

After infrastructure deployment:

```bash
# Upload website files to S3
aws s3 sync ../src/ s3://your-bucket-name --delete
```

### 5. Access Your Application

Your application will be available at the CloudFront distribution URL provided in the Terraform output.

## 📁 Project Structure

```
employee-checkin-webapp/
├── README.md
├── .gitignore
├── terraform/
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Variable definitions     
│   └── outputs.tf           # Output values
│      
├── src/
│   └── index.html           # Main application page
|
├── docs/
│   ├── architecture.png     # Architecture diagram
│   └── screenshots/
└── scripts/
    └── deploy.sh            # Deployment script
```

## 💰 Cost Estimation

Monthly costs for typical usage (assuming 100 employees, 50 check-ins/day):

| Service | Estimated Cost |
|---------|----------------|
| S3 Storage (1GB) | $0.02 |
| S3 Requests | $0.01 |
| CloudFront | $1.00 |
| Certificate Manager | Free |
| **Total** | **~$1.03/month** |

*Note: Costs may vary based on usage patterns and AWS region.*

## 🔧 Configuration Options

### Environment Variables

The application supports the following configuration options:

- `PROJECT_NAME`: Name of the project (default: "employee-checkin")
- `ENVIRONMENT`: Deployment environment (dev/staging/prod)
- `AWS_REGION`: AWS region for deployment
- `DOMAIN_NAME`: Custom domain name (optional)

### Customization

You can customize the application by modifying:

- `src/css/styles.css`: Styling and branding
- `src/js/app.js`: Application logic and features
- `terraform/variables.tf`: Infrastructure parameters

## 📊 Monitoring and Logging

- **CloudFront Logs**: Access logs for monitoring traffic
- **S3 Access Logs**: Detailed request logging
- **AWS CloudWatch**: Metrics and monitoring dashboards

## 🔒 Security Features

- HTTPS encryption for all traffic
- S3 bucket policies restricting direct access
- CloudFront security headers
- No server-side vulnerabilities (static hosting)

## 🚧 Future Enhancements

- [ ] Integration with HR systems
- [ ] Real-time notifications
- [ ] Advanced reporting dashboard
- [ ] Mobile app development
- [ ] Multi-location support
- [ ] Integration with badge systems

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🐛 Troubleshooting

### Common Issues

**Issue**: Terraform fails with permission errors
**Solution**: Ensure your AWS credentials have the required permissions listed in Prerequisites.

**Issue**: Website shows 403 Forbidden
**Solution**: Check S3 bucket policy and ensure `index.html` exists in the bucket root.

**Issue**: CloudFront shows cached old version
**Solution**: Create a cache invalidation for `/*` in the CloudFront console.

### Getting Help

If you encounter issues:

1. Check the [Issues](https://github.com/yourusername/employee-checkin-webapp/issues) page
2. Review AWS CloudFormation events in the AWS Console
3. Check Terraform state and logs
4. Open a new issue with detailed error messages

## 📞 Support

For questions or support:

- Create an issue on GitHub
- Email: your.email@domain.com
- LinkedIn: [Your LinkedIn Profile]

## 🙏 Acknowledgments

- AWS for providing excellent cloud services
- Terraform team for Infrastructure as Code tools
- Open source community for inspiration and resources

---

**Built with ❤️ using AWS and Terraform**
