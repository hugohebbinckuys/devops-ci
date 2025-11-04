FROM node:22
# RUN adduser -D non_root_user
#je crois pas besoin de créer user car user Node de base
RUN npm install -g pnpm
WORKDIR /app
COPY *.json /app/
RUN "pnpm install"
COPY . /app/
CMD [ "pnpm dev" ]