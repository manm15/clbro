FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y xvfb suckless-tools

# Set up the browser
RUN mkdir -p /usr/local/bin
RUN echo "#!/bin/sh\nxvfb-run -a surf https://www.youtube.com/" > /usr/local/bin/start-browser
RUN chmod +x /usr/local/bin/start-browser

# Expose the browser port
EXPOSE 8000

# Start the browser on container launch
CMD ["/usr/local/bin/start-browser"]
