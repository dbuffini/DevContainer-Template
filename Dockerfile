# Start with the official Microsoft Node.js 20 image (with TypeScript support)
FROM mcr.microsoft.com/devcontainers/typescript-node:20

# Switch to root to install OS-level dependencies
USER root

# Install Watchman (highly recommended for React Native/Metro bundler file watching)
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends watchman \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to the non-root 'node' user for security
USER node

# Install global NPM packages needed for Expo development
RUN npm install -g eas-cli
