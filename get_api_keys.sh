#!/bin/bash

echo "🔑 Your API Keys from ~/.zshrc:"
echo ""

# Extract API keys from zshrc
if [ -f ~/.zshrc ]; then
    echo "📋 Copy these values to Railway environment variables:"
    echo ""
    
    # Get OpenRouter API key
    OPENROUTER_KEY=$(grep "OPENROUTER_API_KEY" ~/.zshrc | cut -d'"' -f2)
    if [ ! -z "$OPENROUTER_KEY" ]; then
        echo "OPENROUTER_API_KEY=$OPENROUTER_KEY"
    fi
    
    # Get OpenAI API key
    OPENAI_KEY=$(grep "OPENAI_API_KEY" ~/.zshrc | cut -d'"' -f2)
    if [ ! -z "$OPENAI_KEY" ]; then
        echo "OPENAI_API_KEY=$OPENAI_KEY"
    fi
    
    # Get Gemini API key
    GEMINI_KEY=$(grep "GEMINI_API_KEY" ~/.zshrc | cut -d'=' -f2)
    if [ ! -z "$GEMINI_KEY" ]; then
        echo "GEMINI_API_KEY=$GEMINI_KEY"
    fi
    
    echo ""
    echo "✅ Use these exact values in Railway dashboard"
    echo ""
    echo "🚀 Deploy at: https://railway.com/deploy/bytebot?referralCode=L9lKXQ"
    
else
    echo "❌ ~/.zshrc not found"
    echo "Please check your shell configuration file for API keys"
fi