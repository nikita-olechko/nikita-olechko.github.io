# nikita-olechko.github.io

Personal website for Nikita Olechko, hosted on GitHub Pages.

## 🌐 Live Site

The site is automatically deployed to GitHub Pages at: `https://nikita-olechko.github.io`

## 🚀 GitHub Pages Setup

This repository is configured to deploy to GitHub Pages using GitHub Actions. The setup includes:

### Automatic Deployment

- **Workflow**: `.github/workflows/deploy.yml`
- **Trigger**: Automatically deploys on push to `main` branch
- **Build Tool**: Vite
- **Output**: Static site built to `build/` directory

### Custom Domain Configuration

To connect your custom domain `olechko.me`:

1. Go to your repository **Settings** → **Pages**
2. Under "Custom domain", enter `olechko.me`
3. Check "Enforce HTTPS" (recommended)
4. Configure DNS records with your domain provider:
   - For apex domain (`olechko.me`):
     ```
     A     185.199.108.153
     A     185.199.109.153
     A     185.199.110.153
     A     185.199.111.153
     ```
   - For www subdomain (`www.olechko.me`):
     ```
     CNAME nikita-olechko.github.io
     ```

### GitHub Pages Settings

Make sure GitHub Pages is configured correctly:

1. Go to **Settings** → **Pages**
2. Under "Build and deployment":
   - **Source**: GitHub Actions
   - This should be automatically selected when using the workflow

## 🛠️ Local Development

### Prerequisites

- Node.js 20 or higher
- npm

### Setup

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

## 📁 Project Structure

```
.
├── .github/
│   └── workflows/
│       ├── deploy.yml          # GitHub Pages deployment workflow
│       └── docker-publish.yml  # Docker image publishing
├── public/                     # Static assets
│   ├── config.js              # Runtime configuration
│   ├── favicon.ico
│   ├── manifest.json
│   └── robots.txt
├── src/                        # React source code
│   ├── App.tsx
│   ├── components/
│   ├── index.tsx
│   └── ...
├── index.html                  # Entry HTML file
├── vite.config.ts             # Vite configuration
└── package.json
```

## 🐳 Docker Deployment (Alternative)

This repository also includes Docker configuration for alternative deployment:

```bash
# Build Docker image
docker build -t personal-site .

# Run container
docker run -p 80:80 personal-site
```

## 📝 Tech Stack

- **Framework**: React 18
- **Build Tool**: Vite
- **Language**: TypeScript
- **Styling**: CSS
- **Deployment**: GitHub Pages / Docker

## 📧 Contact

Nikita Olechko - nikita.olechko@gmail.com
