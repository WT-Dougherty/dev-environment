# Ubuntu base image
FROM ubuntu:24.04

# Update and install basic packages + SSH server
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Create SSH privilege separation directory
RUN mkdir -p /run/sshd

# Create admin user
RUN useradd -m -s /bin/bash admin

# Add admin to sudo group and configure passwordless sudo
RUN usermod -aG sudo admin
RUN echo "admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/admin

# Create .ssh directory for admin
RUN mkdir -p /home/admin/.ssh && chmod 700 /home/admin/.ssh

# Copy public key as authorized_keys
COPY ssh/access_key.pub /home/admin/.ssh/authorized_keys
RUN chmod 600 /home/admin/.ssh/authorized_keys && chown -R admin:admin /home/admin/.ssh

# Copy pre-generated host keys if they exist
COPY ssh/host_key /etc/ssh/ssh_host_ed25519_key
COPY ssh/host_key.pub /etc/ssh/ssh_host_ed25519_key.pub

# Set proper permissions on host keys
RUN chmod 600 /etc/ssh/ssh_host_ed25519_key && chmod 644 /etc/ssh/ssh_host_ed25519_key.pub

# Set working directory
WORKDIR /home

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]