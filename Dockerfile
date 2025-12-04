FROM node:20-alpine

WORKDIR /app

# Copy package files first for better Docker layer caching
COPY package*.json ./

RUN npm ci --only=production

# Copy source code
COPY . .

# Run the action
ENTRYPOINT ["node", "index.js"]
