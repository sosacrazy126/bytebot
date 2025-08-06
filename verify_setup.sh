#!/bin/bash

echo "🔍 Verifying Bytebot OpenRouter Configuration..."
echo ""

# Check if .env file exists
if [ -f "docker/.env" ]; then
    echo "✅ docker/.env file exists"
else
    echo "❌ docker/.env file not found"
    exit 1
fi

# Check if OpenRouter API key is set
if grep -q "OPENROUTER_API_KEY=sk-or-v1-" docker/.env; then
    echo "✅ OpenRouter API key is configured"
else
    echo "❌ OpenRouter API key not found or invalid"
    exit 1
fi

# Check if LiteLLM config has OpenRouter model
if grep -q "openrouter/horizon-beta" packages/bytebot-llm-proxy/litellm-config.yaml; then
    echo "✅ OpenRouter horizon-beta model configured in LiteLLM"
else
    echo "❌ OpenRouter model not found in LiteLLM config"
    exit 1
fi

# Check if docker-compose.proxy.yml has OpenRouter env var
if grep -q "OPENROUTER_API_KEY" docker/docker-compose.proxy.yml; then
    echo "✅ OpenRouter environment variable configured in Docker Compose"
else
    echo "❌ OpenRouter environment variable not found in Docker Compose"
    exit 1
fi

echo ""
echo "🎉 Configuration verification complete!"
echo ""
echo "Next steps:"
echo "1. Start Bytebot: docker-compose -f docker/docker-compose.proxy.yml up -d"
echo "2. Check models: curl http://localhost:9991/tasks/models"
echo "3. Access UI: http://localhost:9992"
echo ""
echo "The 'horizon-beta' model should be available in the model selector."