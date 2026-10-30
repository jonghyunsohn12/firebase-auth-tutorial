# Base image with Node preinstalled
FROM node:16-alpine

# All later commands run in this folder
WORKDIR /usr/src/app

# Copy dependency files first for layer caching
COPY package*.json ./
RUN npm ci

# Copy the application source
COPY . .

# Port used by the React development server
EXPOSE 3000

# Listen on every interface so the host browser can connect
ENV HOST=0.0.0.0
CMD ["npm", "start"]
