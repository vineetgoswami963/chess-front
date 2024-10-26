# Use Node 14 as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy project files to the container
COPY . .

# Install npm dependencies
RUN npm install

# Expose the necessary port (change this if your app uses a different port)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
