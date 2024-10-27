# Use Node 14 as the base image
FROM node:14

# Install Nix
RUN curl -L https://nixos.org/nix/install | sh && \
    . /root/.nix-profile/etc/profile.d/nix.sh

# Install Python 3.10 and any necessary Nix dependencies
RUN nix-env -iA nixpkgs.python310

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
