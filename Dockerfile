# Dockerfile for Railway deployment - bytebot-ui
FROM node:20-alpine

# Declare build arguments
ARG BYTEBOT_AGENT_BASE_URL=http://localhost:9991
ARG BYTEBOT_DESKTOP_VNC_URL=http://localhost:9990/websockify

# Set environment variables for the build process
ENV BYTEBOT_AGENT_BASE_URL=${BYTEBOT_AGENT_BASE_URL}
ENV BYTEBOT_DESKTOP_VNC_URL=${BYTEBOT_DESKTOP_VNC_URL}

# Create app directory
WORKDIR /app

# Copy app source
COPY ./packages/shared ./shared
COPY ./packages/bytebot-ui/ ./bytebot-ui

WORKDIR /app/bytebot-ui

# Install dependencies
RUN npm install

RUN npm run build

# Expose port
EXPOSE 9992

# Run the application
CMD ["npm", "run", "start"]
