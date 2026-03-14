FROM puppet/puppetserver:latest

# Install required modules
RUN puppet module install puppetlabs-registry --version 4.0.1
RUN puppet module install puppetlabs-chocolatey --version 8.0.0
RUN puppet module install puppetlabs-iis --version 9.0.0

# Expose Puppet Server port
EXPOSE 8140

# Start Puppet Server
CMD ["puppetserver", "foreground"]