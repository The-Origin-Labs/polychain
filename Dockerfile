FROM node:18
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install && mv node_modules ../
COPY . .
ENV PORT=${PORT}
EXPOSE 8009
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
