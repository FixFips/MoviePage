FROM node:lts-alpine
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# Need dev deps (Vite/plugin) to build and preview, so install them.
ENV NODE_ENV=development
RUN npm install --silent
COPY . .
RUN npm run build
ENV NODE_ENV=production
EXPOSE 3000
RUN chown -R node:node /usr/src/app
USER node
CMD ["npm", "run", "start"]
