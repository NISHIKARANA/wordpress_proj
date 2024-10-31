# Dockerfile for WordPress
FROM wordpress:latest

# Define environment variables (replace these in docker-compose.yml)
ENV WORDPRESS_DB_HOST=mysql
ENV WORDPRESS_DB_USER=root
ENV WORDPRESS_DB_PASSWORD=Pa$$word
ENV WORDPRESS_DB_NAME=wordpress

# Expose the web server port
EXPOSE 80
