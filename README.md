# Run and deploy your AI Studio app

This contains everything you need to run your app locally or with Docker.

## Run Locally

**Prerequisites:**  Node.js

1. Install dependencies:
   `npm install`
2. Set the `GEMINI_API_KEY` in [.env.local](.env.local) to your Gemini API key
3. Run the app:
   `npm run dev`

## Run with Docker

**Prerequisites:** Docker

### 1. Build the Docker image:
```bash
docker build -t live-audio .
```

### 2. Run the container with your API key:
```bash
docker run -d -e GEMINI_API_KEY=your_actual_api_key_here -p 4173:4173 live-audio
```

### 3. Access the application:
Open your browser and navigate to `http://localhost:4173`

### Docker Environment Variables:
- `GEMINI_API_KEY`: Your Google Gemini API key (required)

### Docker Features:
- **Production Build**: The container builds and serves the optimized production version
- **Environment Variable Injection**: API key is injected at runtime for security
- **Port 4173**: The application runs on Vite's preview port
- **Auto-start**: Container automatically builds and starts the application

### Alternative Development Mode:
If you want to run in development mode with live reload:
```bash
docker run -e GEMINI_API_KEY=your_api_key -p 5173:5173 -v "$(pwd):/app" live-audio npm run dev -- --host 0.0.0.0
```

### Troubleshooting:
- Make sure Docker is running on your system
- Ensure port 4173 is available and not blocked by firewall
- Verify your GEMINI_API_KEY is valid and has proper permissions
- Check container logs: `docker logs <container_id>`
