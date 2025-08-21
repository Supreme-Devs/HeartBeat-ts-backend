#!/bin/bash
set -e

echo "🔹 Setting up TypeScript backend..."

# Go into the correct folder
cd "$(dirname "$0")/../packages/store"

# Run Prisma commands
bunx prisma migrate dev
bunx prisma generate

echo "✅ TypeScript backend setup complete!"
