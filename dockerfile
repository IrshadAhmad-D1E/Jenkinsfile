# Use official Node.js LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files first to leverage Docker cache
COPY package*.json ./
COPY yarn.lock ./

# Install dependencies (use yarn or npm based on your project)
RUN npm install --production
# OR if using yarn:
# RUN yarn install --production

# Copy all application files
COPY . .

# Build the application (if needed)
RUN npm run build

# Expose the application port
EXPOSE 3000

# Define the startup command
CMD ["npm", "start"]
