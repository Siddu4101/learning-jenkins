FROM ubuntu:rolling

# Install OpenSSH server
RUN apt update && apt install -y openssh-server

# Create SSH run directory
#RUN mkdir /var/run/sshd

# Set root password
RUN echo 'root:password' | chpasswd

# Permit root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]

