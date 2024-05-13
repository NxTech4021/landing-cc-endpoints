FROM node

WORKDIR /app

COPY ./yarn.lock ./app
COPY ./package.json ./app

RUN yarn install
RUN yarn prisma generate

COPY . .

CMD [ "yarn", "dev" ]