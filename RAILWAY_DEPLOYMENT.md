# Railway Deployment with OpenRouter

This guide shows how to deploy Bytebot with OpenRouter horizon-beta model support on Railway.

## Quick Deploy

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/bytebot?referralCode=L9lKXQ)

## Pre-configured API Keys

Your local `.env` file contains API keys that you can use for Railway deployment. Use the `get_api_keys.sh` script to safely extract them:

```bash
# Get your API keys from zshrc
./get_api_keys.sh
```

## Deployment Steps

### Option 1: Using Railway CLI (Recommended)

1. **Login to Railway**:
   ```bash
   railway login
   ```

2. **Create a new project**:
   ```bash
   railway new
   ```

3. **Set environment variables**:
   ```bash
   # Get your keys first
   ./get_api_keys.sh
   
   # Then set them (replace with your actual keys)
   railway variables set OPENROUTER_API_KEY=your-openrouter-api-key
   railway variables set OPENAI_API_KEY=your-openai-api-key
   railway variables set GEMINI_API_KEY=your-gemini-api-key
   ```

4. **Deploy**:
   ```bash
   railway up
   ```

### Option 2: Using Railway Web Interface

1. **Fork and Push**: 
   ```bash
   # Push your changes to your GitHub repository
   git push origin main
   ```

2. **Deploy on Railway**:
   - Go to [Railway](https://railway.app)
   - Create new project from GitHub repo
   - Select your forked bytebot repository

3. **Configure Environment Variables**:
   In the Railway dashboard, add these environment variables:
   
   **For bytebot-agent service:**
   - `OPENROUTER_API_KEY`: `your-openrouter-api-key-from-zshrc`
   - `OPENAI_API_KEY`: `your-openai-api-key-from-zshrc`
   - `GEMINI_API_KEY`: `your-gemini-api-key-from-zshrc`

   **For bytebot-llm-proxy service:**
   - Same API keys as above

## Available Models After Deployment

Once deployed, your Bytebot instance will have access to:

### OpenRouter Models
- ✅ **horizon-beta** (Primary model)

### OpenAI Models  
- ✅ **gpt-4.1**
- ✅ **gpt-4o**

### Google Models
- ✅ **gemini-2.5-pro**
- ✅ **gemini-2.5-flash**

### Anthropic Models (if you add the API key)
- **claude-opus-4**
- **claude-sonnet-4**

## Verification

After deployment:

1. **Check the UI**: Visit your Railway app URL
2. **Verify models**: The model selector should show all configured models
3. **Test OpenRouter**: Create a task and select "horizon-beta" model

## Troubleshooting

### Model Not Available
- Check that environment variables are set correctly in Railway dashboard
- Restart the `bytebot-llm-proxy` service
- Check service logs for API key validation errors

### API Key Issues
- Verify API keys are valid and have sufficient credits
- Check that keys are set in the correct service (both agent and proxy need them)

### Connection Issues
- Ensure all services are running (agent, desktop, proxy, UI)
- Check Railway service logs for startup errors
- Verify private networking is working between services

## Cost Monitoring

- **OpenRouter**: Monitor usage at [https://openrouter.ai/activity](https://openrouter.ai/activity)
- **OpenAI**: Check usage at [https://platform.openai.com/usage](https://platform.openai.com/usage)
- **Google**: Monitor at [https://console.cloud.google.com/apis/api/generativelanguage.googleapis.com](https://console.cloud.google.com/apis/api/generativelanguage.googleapis.com)

## Next Steps

1. **Custom Domain**: Add your own domain in Railway dashboard
2. **Authentication**: Set up Railway's built-in auth or external provider
3. **Monitoring**: Set up alerts for API usage and costs
4. **Scaling**: Adjust Railway service resources based on usage

## Support

- **Discord**: [Join our community](https://discord.com/invite/d9ewZkWPTP)
- **Documentation**: [docs.bytebot.ai](https://docs.bytebot.ai)
- **Railway Docs**: [docs.railway.app](https://docs.railway.app)