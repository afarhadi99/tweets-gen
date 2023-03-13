# Use the official Node.js image as the parent image
FROM node:16

# Install yarn package manager
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application files to the container
COPY . .

# Expose the port on which the server will run
EXPOSE 3000

# Start the server on port 3000
CMD ["yarn", "run", "dev"]
