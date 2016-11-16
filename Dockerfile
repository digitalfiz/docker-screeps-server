FROM node:7

RUN npm install -g screeps

EXPOSE 21025 21026

WORKDIR /var/app
COPY . /var/app

CMD ./scripts/run.sh