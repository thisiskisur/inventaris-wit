#!/bin/bash

echo "🚀 Deploying Backend to Railway for Public Access..."

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "📦 Installing Railway CLI..."
    npm install -g @railway/cli
fi

# Login to Railway
echo "🔐 Logging in to Railway..."
railway login

# Navigate to backend directory
cd backend

# Initialize Railway project
echo "🔧 Initializing Railway project..."
railway init

# Add MySQL service
echo "🗄️ Adding MySQL database..."
railway add mysql

# Set environment variables
echo "⚙️ Setting environment variables..."
railway variables set APP_ENV=production
railway variables set APP_DEBUG=false
railway variables set APP_NAME="Inventaris WIT"
railway variables set DB_CONNECTION=mysql

# Deploy
echo "🚀 Deploying to Railway..."
railway up

# Get the deployed URL
echo "🌐 Getting deployment URL..."
BACKEND_URL=$(railway status --json | jq -r '.deployments[0].url')

echo "✅ Deployment complete!"
echo "🌐 Backend URL: $BACKEND_URL"
echo ""
echo "📝 Next steps:"
echo "1. Copy this backend URL: $BACKEND_URL"
echo "2. Update frontend API URL in Vercel dashboard"
echo "3. Set environment variable: VITE_API_URL=$BACKEND_URL/api"
echo "4. Test login at: https://inventaris-wit.vercel.app/"
echo ""
echo "🔧 Run migrations:"
echo "railway run php artisan migrate --force"
echo "railway run php artisan db:seed --force"
