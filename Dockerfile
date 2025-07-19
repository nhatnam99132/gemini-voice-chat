# Use Node.js 18 Alpine as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Create a script to inject environment variables at runtime
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'echo "VITE_GEMINI_API_KEY=$GEMINI_API_KEY" > /app/.env.local' >> /app/start.sh && \
    echo 'npm run build' >> /app/start.sh && \
    echo 'npm run preview -- --host 0.0.0.0 --port 4173' >> /app/start.sh && \
    chmod +x /app/start.sh

# Expose port 4173 (Vite preview default port)
EXPOSE 4173

# Use the start script as entrypoint
CMD ["/app/start.sh"]
