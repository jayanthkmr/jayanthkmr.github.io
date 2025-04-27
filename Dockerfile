FROM ruby:3.1

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    npm

# Set working directory
WORKDIR /usr/src/app

# Copy Gemfile and install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose port 4000
EXPOSE 4000

# Start Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0"] 