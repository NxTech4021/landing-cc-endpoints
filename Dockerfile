FROM node

WORKDIR /app

COPY ./package.json .
COPY ./yarn.lock .

RUN yarn install
RUN npx prisma generate

COPY . .

CMD [ "yarn", "dev" ]