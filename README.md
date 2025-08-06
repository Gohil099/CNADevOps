# AWS Simple App

A simple frontend and backend application designed for easy deployment on AWS EC2.

## 📋 Features

- **Backend**: Node.js with Express
- **Frontend**: HTML5 with vanilla JavaScript
- **API Endpoints**: Health check, data fetching, and message handling
- **AWS Ready**: Configured to work with EC2 public IP addresses

## 🚀 Quick Start

### Local Development

1. Install dependencies:

```bash
npm install
```

2. Start the application:

```bash
npm start
```

3. Open your browser and go to `http://localhost:3000`

### AWS EC2 Deployment

1. **Launch an EC2 Instance**:

   - Choose Amazon Linux 2 or Ubuntu
   - Select t2.micro (free tier eligible)
   - Configure Security Group to allow inbound traffic on port 3000

2. **Connect to your EC2 instance**:

```bash
ssh -i your-key.pem ec2-user@your-ec2-public-ip
```

3. **Install Node.js**:

```bash
# For Amazon Linux 2
sudo yum update -y
sudo yum install -y nodejs npm

# For Ubuntu
sudo apt update
sudo apt install -y nodejs npm
```

4. **Clone/Upload your code**:

```bash
# Option 1: Clone from repository
git clone your-repo-url
cd your-repo-name

# Option 2: Upload files using SCP
scp -i your-key.pem -r ./your-local-folder ec2-user@your-ec2-public-ip:~/
```

5. **Install dependencies and start**:

```bash
npm install
npm start
```

6. **Access your application**:
   - Open browser and go to `http://13.221.23.163:3000`

## 🔧 Configuration

The application is configured to:

- Listen on all network interfaces (`0.0.0.0`)
- Use port 3000 (configurable via PORT environment variable)
- Serve static files from the `public` directory
- Provide CORS support for cross-origin requests

## 📡 API Endpoints

- `GET /` - Serves the frontend
- `GET /api/health` - Server health check
- `GET /api/data` - Fetch sample data
- `POST /api/message` - Send message to server

## 🔒 Security Group Configuration

Make sure your EC2 Security Group allows:

- **Inbound Rule**: Type: Custom TCP, Port: 3000, Source: 0.0.0.0/0 (or your IP range)
- **SSH Access**: Type: SSH, Port: 22, Source: Your IP

## 🛠️ Troubleshooting

1. **Can't access from browser**: Check Security Group settings
2. **Server won't start**: Ensure port 3000 is not in use
3. **Module not found**: Run `npm install` to install dependencies

## 📝 Notes

- This is a simple application for demonstration purposes
- For production use, consider implementing proper security measures
- The application runs in foreground; for production, consider using PM2 or similar process managers

## 🎯 One-Command Deployment

After setting up your EC2 instance and installing Node.js, you can start everything with:

```bash
npm start
```

That's it! Your application will be running and accessible via your EC2 public IP address.
