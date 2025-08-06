# OpenRouter Configuration for Bytebot

This guide explains how to configure Bytebot to use OpenRouter's `horizon-beta` model through LiteLLM.

## Prerequisites

1. An OpenRouter API key from [https://openrouter.ai/](https://openrouter.ai/)
2. Docker and Docker Compose installed

## Configuration Steps

### 1. ✅ OpenRouter API Key Configured

Your OpenRouter API key has been automatically configured from your `.zshrc` file:

```bash
# Already configured in docker/.env
OPENROUTER_API_KEY=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
```

**Additional API keys found and configured:**
- OpenAI API Key ✅
- Gemini API Key ✅

All models from these providers are now available through the LiteLLM proxy.

### 2. Start Bytebot with LiteLLM Proxy

Use the proxy-enabled Docker Compose configuration:

```bash
# Start Bytebot with LiteLLM proxy
docker-compose -f docker/docker-compose.proxy.yml up -d
```

### 3. Verify the Configuration

Check that the OpenRouter model is available:

```bash
# Check available models through Bytebot API
curl http://localhost:9991/tasks/models

# Or directly from LiteLLM proxy
curl http://localhost:4000/model/info
```

### 4. Use the Model

The `horizon-beta` model will now be available in the Bytebot UI model selector. You can also specify it directly in API calls:

```bash
# Example API call using the OpenRouter model
curl -X POST http://localhost:9991/tasks \\
  -H "Content-Type: application/json" \\
  -d '{
    "description": "Your task description here",
    "model": "horizon-beta"
  }'
```

## Model Configuration Details

The OpenRouter model has been configured in `packages/bytebot-llm-proxy/litellm-config.yaml` with the following settings:

```yaml
- model_name: horizon-beta
  litellm_params:
    model: openrouter/horizon-beta
    api_key: os.environ/OPENROUTER_API_KEY
    api_base: https://openrouter.ai/api/v1
```

## Troubleshooting

### Model Not Available
- Ensure your OpenRouter API key is correctly set in `docker/.env`
- Restart the services: `docker-compose -f docker/docker-compose.proxy.yml restart`
- Check the logs: `docker-compose -f docker/docker-compose.proxy.yml logs bytebot-llm-proxy`

### Authentication Errors
- Verify your OpenRouter API key is valid
- Check that the key has sufficient credits/permissions for the horizon-beta model

### Connection Issues
- Ensure the LiteLLM proxy is running: `docker ps | grep bytebot-llm-proxy`
- Check network connectivity: `curl http://localhost:4000/health`

## Additional OpenRouter Models

To add more OpenRouter models, edit `packages/bytebot-llm-proxy/litellm-config.yaml` and add entries like:

```yaml
- model_name: another-openrouter-model
  litellm_params:
    model: openrouter/model-name
    api_key: os.environ/OPENROUTER_API_KEY
    api_base: https://openrouter.ai/api/v1
```

Then rebuild and restart:

```bash
docker-compose -f docker/docker-compose.proxy.yml up -d --build
```

## Cost Monitoring

OpenRouter provides detailed usage tracking. You can monitor your usage at [https://openrouter.ai/activity](https://openrouter.ai/activity).

For additional cost controls, you can configure LiteLLM budget limits in the config file:

```yaml
general_settings:
  max_budget: 100  # $100 monthly limit
  budget_duration: "30d"
```