FROM node

WORKDIR /app

COPY ./package.json .
COPY ./yarn.lock .

RUN yarn install

COPY . .

RUN npx prisma init

RUN yarn prisma generate

EXPOSE 4002

CMD [ "node", "app.js" ]