# Use the official Flutter image as a base
FROM cirrusci/flutter:latest

# Set the working directory
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Get Flutter dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Use nginx to serve the web app
FROM nginx:alpine

# Copy the built web app to nginx's serve directory
COPY --from=0 /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 