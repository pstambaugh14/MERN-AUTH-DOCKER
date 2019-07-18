FROM node:10.16.0
RUN mkdir -p /opt/test/MERN-AUTH-ANSIBLE/
ENV PROJECT_HOME /opt/test/MERN-AUTH-ANSIBLE/
WORKDIR /opt/test/MERN-AUTH-ANSIBLE/
COPY package.json .
RUN npm install
COPY . ./
CMD [ "npm", "run", "dev" ]
