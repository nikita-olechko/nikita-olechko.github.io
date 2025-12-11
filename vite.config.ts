import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
  ],
  server: {
    host: '0.0.0.0',
    port: 3000,
    strictPort: true,
    open: true,
  },
  build: {
    outDir: 'build',
    rollupOptions: {
      onwarn(warning, warn) {
        // Suppress "unreachable code after return" warnings from third-party code
        if (warning.code === 'UNUSED_EXTERNAL_IMPORT' || 
            warning.message?.includes('unreachable')) {
          return;
        }
        warn(warning);
      },
    },
  },
  publicDir: 'public',
  esbuild: {
    logOverride: { 'unreachable-code': 'silent' },
  },
});

