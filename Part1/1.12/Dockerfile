FROM node:14

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

RUN npm i
RUN npm i -g serve

RUN npm run build
CMD ["serve", "-s", "-l", "5000", "build"]