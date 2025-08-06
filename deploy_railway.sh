#!/bin/bash

echo "🚀 Deploying Bytebot with OpenRouter to Railway..."
echo ""

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found. Please install it first:"
    echo "curl -fsSL https://railway.app/install.sh | sh"
    exit 1
fi

# Check if user is logged in
if ! railway whoami &> /dev/null; then
    echo "❌ Not logged into Railway. Please run: railway login"
    exit 1
fi

echo "✅ Railway CLI found and user logged in"
echo ""

# Display the API keys that will be used
echo "📋 API Keys to configure in Railway:"
echo ""
echo "Get your API keys from ~/.zshrc and add them to Railway:"
echo "💡 Run: ./get_api_keys.sh to get your actual keys"
echo ""

echo "🌐 Deployment Options:"
echo ""
echo "1. 🎯 One-Click Deploy (Recommended):"
echo "   Visit: https://railway.com/deploy/bytebot?referralCode=L9lKXQ"
echo "   Then add your API keys in the Railway dashboard"
echo ""
echo "2. 📁 Deploy from GitHub:"
echo "   - Go to https://railway.app"
echo "   - Create new project from GitHub"
echo "   - Select repository: https://github.com/sosacrazy126/bytebot.git"
echo "   - Add your environment variables"
echo ""
echo "3. 🔧 Manual CLI Deploy:"
echo "   Run the following commands manually in an interactive terminal:"
echo "   railway init"
echo "   railway up"
echo ""

echo "✨ After deployment, your Bytebot instance will have:"
echo "   - OpenRouter horizon-beta model ✅"
echo "   - OpenAI GPT models ✅"
echo "   - Google Gemini models ✅"
echo "   - Full desktop environment ✅"
echo ""

echo "📖 For detailed instructions, see:"
echo "   - RAILWAY_DEPLOYMENT.md"
echo "   - OPENROUTER_SETUP.md"
echo ""

echo "🎉 Ready for deployment!"