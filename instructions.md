# Personal Website Project Instructions

## Project Overview
Building a personal website with a configurable file storage system for hosting files and videos.

This is the frontend. For now, create a simple page using React and Vite that says 
"
Hello, website belongs to Nikita Olechko.

You can contact me at nikita.olechko@gmail.com

Pretend there's more things here.
"

Create a structure the website structure located in this folder:

D:\Nikita\Documents\work\databiomes\repos\mikoshi\landing\landing

Obviously ignoring any .env files and any repository specific elements. 

What I want you to extrapolate from that folder is the Vite project structure, the general React structure of the project with components, an app.tsx, etc. You can introduce empty folders and placeholders for now.

Include a dockerfile with the same structure to be able to create a container that will host thsi landing page.

Include a cloudbuild.yaml file too, and any other relevant files.

Ignore this next part: this is for later.

## Technology Stack
- **Backend**: Go (Golang) with HTTP server. Hosted on Railway
- **Frontend**: TypeScript + React (as originally planned). Hosted on Vercel.
- **File Storage**: Backblaze B2 (chosen for cost-effectiveness)
- **Database**: 
- **Hosting**: Backblaze B2 storage

## File Storage Requirements
- **Primary Use**: Video storage and hosting
- **Cost Consideration**: Backblaze B2 chosen over Google Cloud for cost savings
- **Expected Volume**: Low video count initially, but scalable
- **Access Control**: Configurable by access levels
- **File Types**: Videos, images, documents (.txt, .md, .json, .jpg, .png, .pdf)

## Backblaze B2 Configuration
- **Storage Cost**: $0.005/GB/month
- **Download Cost**: $0.01/GB (egress fees)
- **Upload**: Free
- **Use Case**: Suitable for low-traffic video hosting initially

## Architecture
```
Frontend (React) → Go Backend → Backblaze B2 (File Storage)
                           ↓
                    Database (TBD)
```

## API Endpoints Required
- `GET /api/files` - List files with optional path parameter
- `POST /api/files` - Upload files with multipart form
- `GET /api/files/{path}` - Download/access files
- `DELETE /api/files/{path}` - Delete files
- `GET /api/config` - Get storage configuration
- `PUT /api/config` - Update storage configuration
- `GET /health` - Health check endpoint

## Security Requirements
- Directory traversal protection
- File type validation
- Access control based on paths
- CORS configuration for frontend integration

## Environment Variables Needed
- `B2_KEY_ID` - Backblaze B2 application key ID
- `B2_APP_KEY` - Backblaze B2 application key
- `B2_BUCKET_NAME` - Backblaze B2 bucket name
- `B2_ENDPOINT` - Backblaze B2 S3-compatible endpoint
- `PORT` - Server port (default: 8080)

## File Structure
- `/storage` - Local storage directory (if needed)
- `/public` - Publicly accessible files
- `/private` - Private/restricted files

## Cost Optimization Strategy
- Use Backblaze B2 for storage ($0.005/GB/month)
- Consider Cloudflare CDN for future scaling (free 10TB bandwidth)
- VPS hosting for backend ($5-10/month)
- Monitor download costs as traffic grows

## Future Considerations
- Cloudflare CDN integration for global performance
- Video optimization and compression
- Database integration for metadata
- User authentication and access control
- Analytics and usage tracking

## Development Priority
1. Set up Go backend with Backblaze B2 integration
2. Implement file upload/download/list/delete operations
3. Add security and validation
4. Create React frontend for file management
5. Deploy to VPS with proper configuration