# Use latest Node.js
FROM node:14

# Set working directory
WORKDIR /app

# copy package.json AND package.lock.json
COPY package*.json ./

# install dependencies
RUN npm install

# Copy entire app to the working directory
COPY . .

# build app
RUN npm run build

# install serve globally
RUN npm install -g serve

# expose port 3000
EXPOSE 3000

# serve the app using serve on port 3000 inside the container
CMD ["serve", "-s", "build", "-l", "3000"]
