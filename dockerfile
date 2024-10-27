# Use Node 14 as the base image
FROM node:14

# Install Nix
RUN curl -L https://nixos.org/nix/install | sh && \
    . /root/.nix-profile/etc/profile.d/nix.sh

# Install Python 3.10 using Nix and set it as the default Python version
RUN nix-env -iA nixpkgs.python310 && \
    ln -sf $(which python3.10) /usr/bin/python

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
