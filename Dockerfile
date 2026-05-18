# Ubuntu base image
FROM ubuntu:24.04

# Update and install basic packages + SSH server
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Create .ssh directory
RUN mkdir -p /home/.ssh && chmod 700 /home/.ssh

# Copy public key as authorized_keys
COPY ssh/key.pub /home/.ssh/authorized_keys
RUN chmod 600 /home/.ssh/authorized_keys

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]