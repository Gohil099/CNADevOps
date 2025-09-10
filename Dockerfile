# Use an official Bun runtime as a parent image
FROM oven/bun:1-alpine
# Set the working directory in the container
WORKDIR /usr/src/app
# Copy package.json and bun.lockb
COPY package.json bun.lock* ./
# Install app dependencies
RUN bun install --frozen-lockfile
# Bundle app source
COPY . .
# Your app binds to port 3000 so you'll use this port
EXPOSE 3000
# Define the command to run your app
CMD [ "bun", "run", "index.ts" ]