FROM node

WORKDIR /app

COPY ./package.json .
COPY ./yarn.lock .

RUN yarn install

COPY . .

RUN npx prisma generate

EXPOSE 4002

CMD [ "node", "app.js" ]