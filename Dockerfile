FROM node:12

# Create app directory
RUN mkdir -p /app/
WORKDIR /app/

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /app/

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
RUN npm install --save node-opcua

# Bundle app source
COPY . /app/

EXPOSE 8080

CMD [ "node", "backend/SkillMonitoring.js" ]