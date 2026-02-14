# GitHub Pages Setup Instructions

This document provides step-by-step instructions for completing the GitHub Pages setup for this repository.

## Prerequisites

- Repository must be named `username.github.io` format (✅ Already done: `nikita-olechko.github.io`)
- Repository must be public for GitHub Pages to work with free accounts
- You need admin access to the repository

## Step 1: Enable GitHub Pages

1. Navigate to your repository on GitHub: `https://github.com/nikita-olechko/nikita-olechko.github.io`

2. Click on **Settings** (⚙️ gear icon)

3. In the left sidebar, click on **Pages** under the "Code and automation" section

4. Under "Build and deployment":
   - **Source**: Select "**GitHub Actions**"
   - This enables the automated deployment workflow we've created

5. Save the settings (if there's a save button)

## Step 2: Merge and Deploy

1. Merge this Pull Request into the `main` branch

2. The GitHub Actions workflow will automatically:
   - Install dependencies
   - Build the React application
   - Deploy to GitHub Pages

3. Monitor the deployment:
   - Go to the **Actions** tab in your repository
   - Watch the "Deploy to GitHub Pages" workflow
   - It should complete in 2-3 minutes

4. Once complete, your site will be live at:
   ```
   https://nikita-olechko.github.io
   ```

## Step 3: Custom Domain Configuration (Optional)

To use your custom domain `olechko.me`:

### On GitHub:

1. Go to **Settings** → **Pages**

2. Under "Custom domain":
   - Enter: `olechko.me`
   - Click **Save**

3. Wait for DNS check to complete (can take a few minutes)

4. Once verified, check "**Enforce HTTPS**" (highly recommended)

### At Your Domain Registrar:

Configure the following DNS records:

#### For Apex Domain (olechko.me):
```
Type: A
Name: @
Value: 185.199.108.153

Type: A
Name: @
Value: 185.199.109.153

Type: A
Name: @
Value: 185.199.110.153

Type: A
Name: @
Value: 185.199.111.153
```

#### For WWW Subdomain (www.olechko.me):
```
Type: CNAME
Name: www
Value: nikita-olechko.github.io
```

**Note**: DNS propagation can take 24-48 hours, but usually completes within 1-2 hours.

## Verification

After setup is complete, verify:

1. ✅ GitHub Actions workflow runs successfully
2. ✅ Site is accessible at `https://nikita-olechko.github.io`
3. ✅ (Optional) Custom domain works: `https://olechko.me`
4. ✅ HTTPS is enforced

## Troubleshooting

### Site not deploying
- Check the Actions tab for errors
- Ensure the workflow has proper permissions
- Verify GitHub Pages is set to "GitHub Actions" source

### 404 errors
- Ensure the `main` branch has the workflow file
- Check that the build completed successfully
- Wait a few minutes for GitHub's CDN to update

### Custom domain not working
- Verify DNS records are correctly configured
- Check DNS propagation status: https://dnschecker.org
- Ensure GitHub shows "DNS check successful"

## Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Managing a custom domain for GitHub Pages](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [Troubleshooting custom domains](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages)
