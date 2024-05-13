FROM node

WORKDIR /app

COPY ./package.json .
COPY ./yarn.lock .

RUN yarn install

COPY . .

RUN npx prisma generate

CMD [ "node", "app.js" ]